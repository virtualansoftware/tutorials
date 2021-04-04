# Cucumblan-Message

[![Maven Central](https://img.shields.io/maven-central/v/io.virtualan/cucumblan-message.svg?label=Maven%20Central)](https://search.maven.org/search?q=g:%22io.virtualan%22%20AND%20a:%22cucumblan-message%22) 

## What is it
Cucumblan-message library contains predefined Gherkin step defination for Kafka message event testing. Cucumblan-message provides options to Test engineer, Manual Testers and Subject Matter Exports write feature files without having development excelency. This would **help lot more for Product Owner/Business analysts(Non technical team members) can create a features without knowing** the technical details. Simply knowing the Step definations.
  
## Maven dependency:
  
  ```mvn 
    <dependency>
      <groupId>io.virtualan</groupId>
       <artifactId>cucumblan-message</artifactId>
       <version>${cucumblan-message.version}</version>
    </dependency>
  ```  

## Project Code and Live demo link
- [KAFKA Message Project](https://github.com/virtualansoftware/cucumblan/tree/master/samples/cucumblan-message-testing)

## Predefined Step Definition

### Predefined to Produce Kafka Message event:
> send message event **\<EVENT NAME>** on **\<RESOURCE>** with type **\<PREDEINED MESSAGE TYPE>**

```gherkin
Given send message event TEST on pet with type JSON
  |  {   "category": {     "id": 100,     "name": "string"   },   "id": 200,   "name": "doggie",   "photoUrls": [     "string","text"   ],   "status": "available",   "tags": [     {       "id": 0,       "name": "string"     }   ] } |
```

### Predefined Verify Kafka Message event using JSON PATH way:
> verify-by-elements **\<EVENT NAME>** contains **\<IDENTIFIER>** on **\<RESOURCE>** with type **\<PREDEINED MESSAGE TYPE>**

```gherkin
  When verify-by-elements TEST contains 200 on pet with type JSON
    | id            | i~200           |
    | <jsonpath>      | <value>         |
```

### Predefined Verify Kafka Message event using CSVSON way:
> verify **\<EVENT NAME>** contains **\<IDENTIFIER>** on **\<RESOURCE>** with type **\<PREDEINED MESSAGE TYPE>**

```gherkin
  And verify TEST contains 200 on pet with type JSON
    |id,name, category/id:name,tags/id:name,status,photoUrls|
    |i~200,doggie,i~100:string,i~0:string\|,available,string\|text\||
```

## How to Integrate: 

1. cucumblan.properties - Should be added in classpath

> Customize based on application specific message setup \
> message-package=\<PACKANGE IMPL> 

```properties
message-package=io.virtualan.test.msgtype.impl
```

2. consumer-**\<RESOURCE>**.properties  - Should be added in classpath

```properties
bootstrap.servers=localhost:9092
group.id=cucumblan-consumer-group-test
key.deserializer=org.apache.kafka.common.serialization.IntegerDeserializer
value.deserializer=org.apache.kafka.common.serialization.StringDeserializer
```

3. producer-**\<RESOURCE>**.properties  - Should be added in classpath

```properties
bootstrap.servers=localhost:9092
key.serializer=org.apache.kafka.common.serialization.IntegerSerializer
value.serializer=org.apache.kafka.common.serialization.StringSerializer
```
4. topic.properties

> Event name associated with Topic to read the message.\
> \<EVENT NAME>=\<TOPIC> 

```properties
Create=employee  #Create is the event and employee is topic
Update=employee  #Update is the event and employee is topic
Delete=employee  #Delete is the event and employee is topic
```

5. Implement MessageType 

> **Build Producer Message**\
> Build producer based message type based on application specific needs using the following method in the message type interface\
> MessageType buildProducerMessage(Object tt) throws MessageNotDefinedException;


> **Build Consumer Message**\
> Generate message type based on application specific needs using the following method in the message factory\
> MessageType buildConsumerMessage(ConsumerRecord<T, TT> record, T key, TT value) throws MessageNotDefinedException; 


**Example JSON implementation**
```java
package io.virtualan.cucumblan.message.typeimpl;

import io.virtualan.cucumblan.message.exception.MessageNotDefinedException;
import io.virtualan.cucumblan.message.type.MessageType;
import io.virtualan.mapson.Mapson;
import io.virtualan.mapson.exception.BadInputDataException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.apache.kafka.common.header.Header;
import org.json.JSONObject;

/**
 * The type Json message.
 */
public class JSONMessage implements MessageType<Integer, String> {

  //MANDATORY
  private String type = "JSON";
  private Integer id;
  private String body;

  /**
   * Instantiates a new Json message.
   */
  public JSONMessage() {
  }

  /**
   * Instantiates a new Json message.
   *
   * @param id   the id
   * @param body the body
   */
  public JSONMessage(Integer id, String body) {
    this.body = body;
    this.id = id;
  }

  @Override
  public String getType() {
    return type;
  }

  @Override
  public List<Header> getHeaders() {
    return null;
  }

  @Override
  public Integer getId() {
    return id;
  }

  @Override
  public String getMessage() {
    return body;
  }

  @Override
  public JSONObject getMessageAsJson() {
    return new JSONObject(body);
  }

  @Override
  public MessageType buildProducerMessage(Object messages) throws  MessageNotDefinedException {
    if (messages instanceof List) {
      String message = ((List<String>) messages).stream().collect(Collectors.joining());
      JSONObject body = new JSONObject(message);
      return new JSONMessage(body.getInt("id"), message);
    } else {
      String message = null;
      try {
        message = Mapson.buildMAPsonAsJson((Map<String, String>) messages);
        JSONObject body = new JSONObject(message);
        return new JSONMessage(body.getInt("id"), message);
      } catch (BadInputDataException e) {
        throw new MessageNotDefinedException(e.getMessage());
      }
    }
  }


  @Override
  public MessageType buildConsumerMessage(ConsumerRecord<Integer, String> record, Integer key, String body)
      throws MessageNotDefinedException {
    Integer id = new JSONObject(body).getInt("id");
    return new JSONMessage(id, body);
  }


  @Override
  public String toString() {
    return "JSONMessage{" +
        "type='" + type + '\'' +
        ", id=" + id +
        ", body=" + body +
        '}';
  }
}
```

----