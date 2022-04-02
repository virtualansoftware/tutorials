## Setup to perform Message validation with Kafka events: 

Test Case: Validate the order creation API and new ordered creation event

As a user, I need to validate the Order Created  event. The OrderCreated contains an unique order number, Product details, and Customer information. Retrieve and Validate the order details from the order created event by order number.


1. Create a Java project in your favorite IDE.
   

2. Create excel with given format for REST api and Kafka event validation save the excel file under resources as createOrder-Event.xlsx

 |TestCaseName|Type|Resource|TestCaseNameDesc|StepInfo|URL|ContentType|Event|Identifier|MessageType|RequestContent|Action|StatusCode|StoreResponseVariables|Csvson|
 |:--------------|:--------------|:-----------|:--------------|:--------------|:--------------|:--------------|:-----|:-----|:-----|:-----|:-----|:-----|:-----|:-----|
 |CREATE_ORDER|REST|orderservice|Create order|As a user needs to;create order;details;order;user;|http://localhost:8800/order/5|application/json|||| <pre>{ "customer": { <br>     "customerId": 1001,<br>     "firstname": "Ronnie",<br>     "lastname": "Sander"<br>   },<br>   "orderDesc": "Order Dell Laptop",<br>   "orderStatus": "Started",<br>   "purchasedProducts": [<br>     {<br>       "productId": 901,<br>       "productName": "Dell Inspiron 3583 15",<br>       "productDesc": "Laptop Intel Celeron – 128GB SSD – 4GB DDR4 – 1.6GHz - Intel UHD Graphics 610 - Windows 10 Home in S Mode - Inspiron 15 3000 Series"<br>     }<br>   ]<br> }<br></pre> |POST|201|orderId=orderNumber|```orderDesc,orderStatus,customer/customerId:firstname:lastname,orderStatus```<br>```Order Dell Laptop,Started,i~1001:Ronnie:Sander,Started```|
|VERIFY_ORDER_CREATED_EVENT | KAFKA | json | Validate Insurance user event |contains user information||  | OrderCreated | [orderId] |JSONMessageType|| ||| ```orderNumber,orderDesc,orderStatus,customer/customerId:firstname:lastname,orderStatus```<br>```[orderId],Order Dell Laptop,Started,i~1001:Ronnie:Sander,Started```| 

  - TestCaseName 
    -  Test case name which should be unique.

  - Type 
    - "KAFKA" for Events and "REST" for API.

  - Resource 
    - Used for API Endpoint mapping.
    - The kafka broker that should be connected to validate the "OrderCreated" Event.
    - In this case, "json" is a resource for this consumer. Now the framework will look for "consumer-json.properties" in the classpath. Which would help which broker configuration would be used to consume the message.  

      > consumer-json.properties #  Following values can be substitued by your application specific values.  
        bootstrap.servers=microservices.virtualandemo.com:9092   # kafka broker 
        key.deserializer=org.apache.kafka.common.serialization.StringDeserializer  
        value.deserializer=org.apache.kafka.common.serialization.StringDeserializer
        enable.auto.commit=true
        auto.commit.interval.ms=1000
        session.timeout.ms=30000
        auto.offset.reset=earliest   

  - TestCaseNameDesc 
    - Describes the purpose of the test case.

  - StepInfo  
    - Helps create meaningful step definitions for API and Kafka. 

  - Event 
    - To validate the order details by retrieving the "OrderCreated" event from the mapping kafka topic. This kafka topic with the event mapping will be specified in the "topic.properties" file and add the properties file to the classpath.
            
    > topic.properties
          OrderCreated=dev01.orderCreated  # OrderCreated event would be consumed from the "dev01.orderCreated topic"
          CreateQuote=dev01.createQuote  # CreateQuote event would be consumed from the "dev01.createQuote topic"
  - Identifier 
    - To read the unique event(message) from the given kafka topic. In this case "[orderId]" is the unique order number of the "OrderCreated" event to be validated.

  - Csvson 
    - Comma separated value(csv) of the order information to be validated. i~ represents integer value.
  -  MessageType 
     - This "OrderCreated" event is JSON. Predefined "JSONMessageType" can be used for this event validation.
     - An entry needs to be added to the "json-messagetype.properties"
     - The entry should be "eventname=JSONPath"
     > json-messagetype.properties
       OrderCreated=orderNumber  # "orderNumber" is the json path of the "OrderCreated" Event and the value of the "orderNumber" is used to uniquely identify the event
3. Create API Executor Plan:
    Create the following yml file under resources with "work-flow.yaml".
    > In the Resource column, which contains "orderservice". It represents the service Endpoint in the yml file where the service executed.
    
    > Json test scripts and Feature file generated in the "outputDir" directory that is "target/message"

    > After execution, cucumber report created in the "outputJsonDir" directory that is "target/idaithalam"

```yml
        parallelExecution: 4
        timeout:  30000
        apiExecutor:
        - reportTitle: "API with Kafka Event Testing"
            env: dev
            outputJsonDir: target/idaithalam
            outputDir: target/message
            inputExcel: createOrder_API_with_OrderCreated_Event.xlsx
            cucumblanProperties:
            service.api.orderservice: http://microservices.virtualandemo.com:9001
```

4. Create RestTestPlanExecutor to run the test:

```java
    package io.virtualan.test;
    import io.virtualan.idaithalam.core.api.VirtualanTestPlanExecutor;
    public class KafkaTestPlanExecutor {
        @org.testng.annotations.Test
        public void execute_orderEvent_workflow() {
            try {
                boolean isSuccess = VirtualanTestPlanExecutor.invoke("work-flow.yaml");
                org.junit.Assert.assertTrue(isSuccess);

            } catch (Exception e) {
                org.junit.Assert.assertTrue(false);
            }
        }
    }
```
5. Create testng Test plan 

```xml
   <?xml version="1.0" encoding="UTF-8"?>
   <!DOCTYPE suite SYSTEM "http://testng.org/testng-1.0.dtd">
   <suite name="End-2-End Message automation Suite">
    <test name="End-2-End Message automation Suite" >
        <classes >
            <class name="io.virtualan.test.KafkaTestPlanExecutor" />
        </classes>
    </test>
  </suite>
```

6. Execute the test cases

  > mvn clean install

7. After execution, view the cucumber report under "target/idaithalam". 

## How to build MessageType 
  - Each kafka topic has its own set of events (messages). Each event will have a different set of fields.
    
    Example: "OrderCreated" events have the user specific fields. But CreateQuote events will have different sets of quote specific fields. 
    
    - Implement OrderMessageType
       Lets define the new message type for "OrderCreated '' event and name it as "OrderMessageType ''. In Idaithalam, all data verification is performed as JSON. This handler will parse the event(message) and build "OrderMessageType '' object with Identifier, JSON. 
    - **Following methods need to be implemented**
      - MessageType buildConsumerMessage(ConsumerRecord<T, TT> record, Map<String, String> contextMap) throws MessageNotDefinedException
         This method will parse the consumed event and build the messageType with identifier and specific MessageType Object. It is a mandatory for event verification
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
        ````
        - public org.json.JSONObject getMessageAsJson()
        This method should be implemented to return JSON Object.It is also a mandatory method.
        > Example
        ```JAVA
        //Mandatory
        public org.json.JSONObject getMessageAsJson() {
            return new org.json.JSONObject(this.body); //return JSON Object if not have to build one.
        }      
        ````
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

