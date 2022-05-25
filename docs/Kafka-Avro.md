## Avro message validation 

Test Case: Validate the user creation API and new UserCreated creation event

As a user, I need to validate the user Created  event. The UserCreated contains an unique name, userDetails details, and user information. Retrieve and Validate the user details from the user created event by name.


1. Create a Java project in your favorite IDE.
   

2. Create excel with given format for REST api and Kafka event validation save the excel file under resources as createUser-Event.xlsx

 |TestCaseName|Type|Resource|TestCaseNameDesc|StepInfo|URL|ContentType|Event|Identifier|MessageType|Action|StatusCode|StoreResponseVariables|Csvson|
 |:--------------|:--------------|:-----------|:--------------|:--------------|:--------------|:--------------|:-----|:-----|:-----|:-----|:-----|:-----|:-----|
 |CREATE_USER|REST|user|Create user|As a user needs to;create user;details;user;user;contains user information in api;|http://localhost:9080/user/publish?name=Ryan&age=44|application/json||||POST|201|||
 |VERIFY_USER_CREATED_EVENT | KAFKA | avro | Validate created user event |contains user information||  | UserCreated | Ryan |JSONMessageType|||| ```name,age```<br>```Ryan,44```| 

  - TestCaseName 
    -  Test case name which should be unique.

  - Type 
    - "KAFKA" for Events and "REST" for API.

  - Resource 
    - Used for API Endpoint mapping.
    - The kafka broker that should be connected to validate the "UserCreated" Event.
    - In this case, "avro" is a resource for this consumer. Now the framework will look for "consumer-avro.properties" in the classpath. Which would help which broker configuration would be used to consume the message.  

      > consumer-avro.properties #  Following values can be substitued by your application specific values.
         ```properties
              bootstrap.servers: microservices.virtualandemo.com:9092
              key.deserializer: org.apache.kafka.common.serialization.StringDeserializer
              value.deserializer: io.confluent.kafka.serializers.KafkaAvroDeserializer
              enable.auto.commit: true
              auto.commit.interval.ms: 1000
              session.timeout.ms: 30000
              auto.offset.reset: earliest
              schema.registry.url: http://microservices.virtualandemo.com:8081
              value.deserializer.specific.avro.reader: true
        ```
  - TestCaseNameDesc 
    - Describes the purpose of the test case.

  - StepInfo  
    - Helps create meaningful step definitions for API and Kafka. 
  
  - StoreResponseVariables
    - From the API response and it allows to create multiple variables using key=value; key as "variable name" and value as "jsonpath"    

  - Event 
    - To validate the user details by retrieving the "UserCreated" event from the mapping kafka topic. This kafka topic with the event mapping will be specified in the "topic.properties" file and add the properties file to the classpath.
    
    > topic.properties    
    ```properties
    UserCreated: dev01.userCreated  # UserCreated event would be consumed from the "dev01.userCreated topic"
    ```
  - Identifier 
    - To read the unique event(message) from the given kafka topic. In this case "name" is the unique name of the "UserCreated" event to be validated.

  - Csvson 
    - Comma separated value(csv) of the user information to be validated. i~ represents integer value.
  -  MessageType 
     - This "UserCreated" event is avro message. Predefined "AvroType" can be used for this event validation.
     - An entry needs to be added to the "json-messagetype.properties"
     - The entry should be "\<eventname>=\<avro-file-classpath>;\<JSONPath>"
     > avro-messagetype.properties
       
       ```properties
       UserCreated=avro/user.avsc;name  # "name" is the json path of the "UserCreated" Event and the value of the "name" is used to uniquely identify the event
       ```

3. Create API Executor Plan:
  
  I. **In the Resource column,** 
    1. which contains "user" - It represents the service Endpoint where the service executed.
    2.  which contains "avro" - It is the resouce of Kafka broker to be connected to read and produce message
    3. Json test scripts and Feature file generated in the "outputDir" directory that is "testscript-generated/user-avro"
    4. After execution, cucumber report created in the "outputJsonDir" directory that is "target/idaithalam"
  
  II. Create the following yml file under resources with "work-flow.yaml".      
    ```yml
      parallelExecution: 4
      timeout:  3
      apiExecutor:
        - reportTitle: "1. API with Kafka Event Testing With Student"
          env: dev
          outputJsonDir: target/idaithalam
          outputDir: testscript-generated/user-avro
          inputExcel: event-xls/CreateUser-Event.xlsx
          cucumblanProperties:
            service.api.user: http://microservices.virtualandemo.com:9080
          consumers:
            avro:
              bootstrap.servers: microservices.virtualandemo.com:9092
              key.deserializer: org.apache.kafka.common.serialization.StringDeserializer
              value.deserializer: io.confluent.kafka.serializers.KafkaAvroDeserializer
              enable.auto.commit: true
              auto.commit.interval.ms: 1000
              session.timeout.ms: 30000
              auto.offset.reset: earliest
              schema.registry.url: http://microservices.virtualandemo.com:8081
              value.deserializer.specific.avro.reader: true
          producers:
            avro:
              bootstrap.servers: microservices.virtualandemo.com:9092
              key.serializer: org.apache.kafka.common.serialization.StringSerializer
              value.serializer: io.confluent.kafka.serializers.KafkaAvroSerializer
              schema.registry.url: http://microservices.virtualandemo.com:8081
          topicProperties:
            UserCreated: dev01.userCreated
    ```
4. Create KafkaTestPlanExecutor to run the test:

   ```java
    package io.virtualan.test;
    import io.virtualan.idaithalam.core.api.VirtualanTestPlanExecutor;
    public class KafkaTestPlanExecutor {
        @org.testng.annotations.Test
        public void execute_userEvent_workflow() {
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