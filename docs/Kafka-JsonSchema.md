## JsonSchema Message validation : 

Test Case: Validate the pet creation and new pet creation event

As a user, I need to validate the Pet Created  event. The PetCreated contains an unique Id, pet information. Retrieve and Validate the pet details from the pet created event by id.


1. Create a Java project in your favorite IDE.
   

2. Create excel with given format for REST api and Kafka event validation save the excel file under resources as CreatePet-Event.xlsx

 |TestCaseName|Type|Resource|TestCaseNameDesc|StepInfo|Event|Identifier|MessageType|RequestContent|Csvson|
 |:--------------|:--------------|:-----------|:--------------|:--------------|:--------------|:--------------|:-----|:-----|:-----|
 |SEND_PET|KAFKA|jsonschema|Create Pet|As a user needs to;create pet;details;pet;pet;|PetCreated||JsonSchemaType| <pre>{<br/>"photoUrls": [<br/>    "string"<br/>  ],<br/>  "name": <br/>"doggie", <br/>  "id": 100,<br/>   "category": {<br/>    "name": "string",<br/>    "id": 100 <br/>  },<br/>  "status": "available",<br/>  "tags": [ <br/>    { <br/>      "name": <br/>string", <br/>       "id": 0 <br/>    }<br/>  ]<br/>}</pre> ||
|VERIFY_PET_CREATED_EVENT | KAFKA | jsonschema | Validate Pet event |contains pet information|PetCreated | 100 |JsonSchemaType|| ```id,name,status```<br>```100,doggie,available ```| 

  - TestCaseName 
    -  Test case name which should be unique.

  - Type 
    - "KAFKA" for Events and "REST" for API.

  - Resource 
    - Used for API Endpoint mapping.
    - The kafka broker that should be connected to validate the "PetCreated" Event.
    - In this case, "jsonschema" is a resource for this consumer. Now the framework will look for "consumer-jsonschema.properties" in the classpath. Which would help which broker configuration would be used to consume the message.  

    > consumer-jsonschema.properties #  Following values can be substitued by your application specific values.
  ```properties
  bootstrap.servers: microservices.virtualandemo.com:9092
  key.deserializer: org.apache.kafka.common.serialization.StringDeserializer
  value.deserializer: io.confluent.kafka.serializers.json.KafkaJsonSchemaDeserializer
  enable.auto.commit: true
  auto.commit.interval.ms: 1000
  session.timeout.ms: 30000
  auto.offset.reset: earliest
  schema.registry.url: http://microservices.virtualandemo.com:8081
  ```
  - TestCaseNameDesc 
    - Describes the purpose of the test case.

  - StepInfo  
    - Helps create meaningful step definitions for API and Kafka. 
  
  - StoreResponseVariables
    - From the API response and it allows to create multiple variables using key=value; key as "variable name" and value as "jsonpath"    

  - Event 
    - To validate the pet details by retrieving the "PetCreated" event from the mapping kafka topic. This kafka topic with the event mapping will be specified in the "topic.properties" file and add the properties file to the classpath.
    
    > topic.properties    
    ```properties
    PetCreated=dev01.petCreated  # PetCreated event would be consumed from the "dev01.petCreated topic"
    ```
  - Identifier 
    - To read the unique event(message) from the given kafka topic. In this case "100" is the unique id of the "PetCreated" event to be validated.

  - Csvson 
    - Comma separated value(csv) of the pet information to be validated. i~ represents integer value.
  -  MessageType 
     - This "PetCreated" event is JSON message. Predefined "JsonSchemaType" can be used for this event validation.
     - An entry needs to be added to the "json-messagetype.properties"
     - The entry should be "\<eventname>=\<Fully-Qualified-Class-Name>;\<JSONPath>"
     > jsonschema-messagetype.properties
       
       ```properties
       PetCreated=io.virtualan.jsonschema.Pet;id
       ```

3. Create API Executor Plan:

  I. **In the Resource column,** 
      1.  which contains "proto" - It is the resouce of Kafka broker to be connected to read and produce message
      2. Json test scripts and Feature file generated in the "outputDir" directory that is "testscript-generated/pet-jsonschema"
      3. After execution, cucumber report created in the "outputJsonDir" directory that is "target/idaithalam"
  
  II. Create the following yml file under resources with "work-flow.yaml".
  ```yml
    parallelExecution: 4
    timeout:  30000
    apiExecutor:
      - reportTitle: "API with Kafka Event Testing JSON Schema"
        env: dev
        outputJsonDir: target/idaithalam
        outputDir: testscript-generated/pet-jsonschema
        inputExcel: event-xls/CreatePet-Event.xlsx
        consumers:
          jsonschema:
            bootstrap.servers: microservices.virtualandemo.com:9092
            key.deserializer: org.apache.kafka.common.serialization.StringDeserializer
            value.deserializer: io.confluent.kafka.serializers.json.KafkaJsonSchemaDeserializer
            enable.auto.commit: true
            auto.commit.interval.ms: 1000
            session.timeout.ms: 30000
            auto.offset.reset: earliest
            schema.registry.url: http://microservices.virtualandemo.com:8081
        producers:
          jsonschema:
            bootstrap.servers: microservices.virtualandemo.com:9092
            key.serializer: org.apache.kafka.common.serialization.StringSerializer
            value.serializer: io.confluent.kafka.serializers.json.KafkaJsonSchemaSerializer
            schema.registry.url: http://microservices.virtualandemo.com:8081
        topicProperties:
          PetCreated: dev01.petCreated
    ```
4. Create KafkaTestPlanExecutor to run the test:

   ```java
    package io.virtualan.test;
    import io.virtualan.idaithalam.core.api.VirtualanTestPlanExecutor;
    public class KafkaTestPlanExecutor {
       @org.testng.annotations.Test
        public void execute_PetEvent_jsonschema_workflow(){
          try {
            boolean isSuccess = VirtualanTestPlanExecutor.invoke("workflow/work-flow-jsonschema.yaml");
            Assert.assertTrue(isSuccess);
          } catch (Exception e) {
            Assert.assertTrue(false);
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