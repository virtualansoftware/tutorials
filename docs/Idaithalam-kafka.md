### Message Type : 

## How to build MessageType 
   - Each kafka topic has its own set of events (messages). Each event will have a different set of fields.
    
    Example: "OrderCreated" events have the user specific fields. But CreateQuote events will have different sets of quote specific fields. 
  - To implement OrderMessageType
        
    - Lets define the new message type for "OrderCreated" event and name it as "OrderMessageType". 
    - In Idaithalam, all the data verification is performed as JSON message. 
    - This handler will parse the event(message) and build "OrderMessageType" object with specific Identifier. 
    
    - **Following methods need to be implemented**
      - MessageType buildConsumerMessage(ConsumerRecord<T, TT> record, Map<String, String> contextMap) throws MessageNotDefinedException
        > This method will parse the consumed event and build the messageType with identifier and specific MessageType Object. It is a mandatory for event verification
        > Example:   
        ```JAVA
           public io.virtualan.cucumblan.message.type.MessageType buildConsumerMessage(
               org.apache.kafka.clients.consumer.ConsumerRecord<String, String> record, Map<String, String> contextMap) 
               throws io.virtualan.cucumblan.message.exception.MessageNotDefinedException {
                 org.json.JSONObject object = new org.json.JSONObject(body);
                 String id = object.getString("orderNumber");        //Retrieve the Identifier
                 object.put("partitionId", record.partition());      //Showcase accessing Kafka headers - partition
                 object.put("kafka-topic-name", record.topic());     //Showcase accessing Kafka headers - topic name
                 return new OrderMessageType(id, object.toString()); //Build the OrderMessageType
            }

            org.apache.kafka.clients.consumer.ConsumerRecord<String, String> record = Kafka consumer record. 
            - Key as String   
            - value as String 
        ```
    - public String getId()  
        
        This method should be implemented to return the identifier.It is also a mandatory method.
        > Example
        ```JAVA
        //Mandatory
        public String getId() {
            return this.id; //return the identifier for the event.
        }       
        ```
    - public org.json.JSONObject getMessageAsJson()
        
        This method should be implemented to return JSON Object.It is also a mandatory method.
        > Example
        ```JAVA
        //Mandatory
        public org.json.JSONObject getMessageAsJson() {
            return new org.json.JSONObject(this.body); //return JSON Object if not have to build one.
        }      
        ```
    - public io.virtualan.cucumblan.message.type.MessageType buildProducerMessage(Object messages) throws io.virtualan.cucumblan.message.exception.MessageNotDefinedException
           
        This method only needed for producing a event. Not a mandatory method for event verification.   
        
**Build Consumer Message**
  > To validate the event, the event should be read and stored by the identifier. Have to implement the following method which is supposed to split the user information by user identifier. Generate message type based on application specific needs using the following method in the message factory.
      
### Example 1 

- OrderMessageType implementation

```java
package io.virtualan.cucumblan.message.typeimpl;

public class OrderMessageType implements io.virtualan.cucumblan.message.type.MessageType<String, String> {
        private String type = "OrderMessageType";
        private String id;
        private String body;

        public OrderMessageType() {
        }

        public OrderMessageType(String id, String body) {
            this.body = body;
            this.id = id;
        }

        public String getType() {
            return this.type;
        }

        public java.util.List<org.apache.kafka.common.header.Header> getHeaders() {
            return null;
        }

        //Mandatory
        public String getId() {
            return this.id;
        }

        public String getKey() {
            return null;
        }

        public String getMessage() {
            return this.body;
        }

       //Mandatory
        public org.json.JSONObject getMessageAsJson() {
            return new org.json.JSONObject(this.body);
        }

        public io.virtualan.cucumblan.message.type.MessageType buildProducerMessage(Object messages) throws io.virtualan.cucumblan.message.exception.MessageNotDefinedException {
           //No need to provide details if we are not producing any message
           return null;
        }

        //Mandatory
        public io.virtualan.cucumblan.message.type.MessageType buildConsumerMessage(org.apache.kafka.clients.consumer.ConsumerRecord<String, String> record, String key, String body) throws io.virtualan.cucumblan.message.exception.MessageNotDefinedException {
            org.json.JSONObject object = new org.json.JSONObject(body);
            String id = object.getString("orderNumber");
            object.put("partitionId", record.partition());
            object.put("kafka-topic-name", record.topic());
            return new OrderMessageType(id, object.toString());
        }

        public String toString() {
            return "OrderCreatedMessageType{type='" + this.type + '\'' + ", id=" + this.id + ", body=" + this.body + '}';
        }
    }

```

### Example 2 
- JSONType implementation

```java
package io.virtualan.cucumblan.message.typeimpl;


import com.jayway.jsonpath.JsonPath;
import java.util.Map.Entry;

public class JSONType implements
    io.virtualan.cucumblan.message.type.MessageType<String, String> {

  private static final java.util.logging.Logger LOGGER = java.util.logging.Logger
      .getLogger(JSONType.class.getName());
  private static java.util.Properties jsonMessageTypeMapper = new java.util.Properties();

  static {
    reload();
  }

  private String type = "JSONType";
  private String id;
  private String body;

  public JSONType() {
  }

  public JSONType(String id, String body) {
    this.body = body;
    this.id = id;
  }

  public static void reload() {
    try {
      java.io.InputStream stream = Thread.currentThread().getContextClassLoader()
          .getResourceAsStream("json-messagetype.properties");
      if (stream == null) {
        stream = io.virtualan.cucumblan.props.ApplicationConfiguration.class.getClassLoader()
            .getResourceAsStream("json-messagetype.properties");
      }
      if (stream != null) {
        jsonMessageTypeMapper.load(stream);
      } else {
        LOGGER.warning("unable to load json-messagetype.properties");
      }
    } catch (Exception var1) {
      LOGGER.warning("json-messagetype.properties not found");
    }

  }

  public String getType() {
    return this.type;
  }

  public java.util.List<org.apache.kafka.common.header.Header> getHeaders() {
    return null;
  }

  //Mandatory
  public String getId() {
    return this.id;
  }

  public String getKey() {
    return this.id;
  }

  public String getMessage() {
    return this.body;
  }

  //Mandatory
  public org.json.JSONObject getMessageAsJson() {
    return new org.json.JSONObject(this.body);
  }

  public io.virtualan.cucumblan.message.type.MessageType buildProducerMessage(Object messages,
      java.util.Map<String, Object> contextParam)
      throws io.virtualan.cucumblan.message.exception.MessageNotDefinedException {
    String message;
    try {
      org.json.JSONObject body;
      if (messages instanceof java.util.List) {
        message = (String) ((java.util.List) messages).stream()
            .collect(java.util.stream.Collectors.joining());
        body = new org.json.JSONObject(message);
        return buildMessageType(body.toString(), contextParam);
      } else {

        message = io.virtualan.mapson.Mapson.buildMAPsonAsJson((java.util.Map) messages);
        body = new org.json.JSONObject(message);
        return buildMessageType(body.toString(), contextParam);
      }
    } catch (io.virtualan.mapson.exception.BadInputDataException | io.virtualan.cucumblan.message.exception.SkipMessageException exception) {
      throw new io.virtualan.cucumblan.message.exception.MessageNotDefinedException(
          exception.getMessage());
    }
  }

  //Mandatory
  public io.virtualan.cucumblan.message.type.MessageType buildConsumerMessage(
      org.apache.kafka.clients.consumer.ConsumerRecord<String, String> record,
      java.util.Map<String, Object> contextParam)
      throws io.virtualan.cucumblan.message.exception.SkipMessageException {
    return buildMessageType(record.value(), contextParam);
  }

  public String toString() {
    return "JSONMessageType{type='" + this.type + '\'' + ", id=" + this.id + ", body=" + this.body
        + '}';
  }

  public JSONType buildMessageType(String body, java.util.Map<String, Object> contextParam)
      throws io.virtualan.cucumblan.message.exception.SkipMessageException {
    if (jsonMessageTypeMapper != null && !jsonMessageTypeMapper.isEmpty()) {
      for (Entry entry : jsonMessageTypeMapper.entrySet()) {
        try {
          if (contextParam.get("EVENT_NAME") != null
              && entry.getKey().toString()
              .equalsIgnoreCase(contextParam.get("EVENT_NAME").toString())) {
              String identifier = buildkey(body, entry.getValue().toString());
              if (identifier != null) {
                  return new JSONType(identifier, body);
              }
          }
        } catch (Exception e) {
        }
      }
    }
    throw new io.virtualan.cucumblan.message.exception.SkipMessageException(body);
  }

    private String buildkey(String body, String paths){
      StringBuilder key = new StringBuilder();
      for(String path : paths.split("(?<!\\\\),")) {
          String pathId = path.replace("\\\\,",",");
            Object identifier = JsonPath.read(body, pathId);
            if(identifier != null) {
                if (key.length() != 0) {
                   key.append("_");
                }
                key.append(identifier.toString());
            }
        }
      return key.toString();
    }
}

```