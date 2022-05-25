## ProtoBuff message validation

Test Case: Validate the customer creation API and new customer creation event

As a user, I need to validate the customer Created  event. The customerCreated contains an unique customer Id, Product details, and Customer information. Retrieve and Validate the customer details from the customer created event by customer Id.


1. Create a Java project in your favorite IDE.
   

2. Create excel with given format for REST api and Kafka event validation save the excel file under resources as CreateCustomer-Event.xlsx

 |TestCaseName|Type|Resource|TestCaseNameDesc|StepInfo|URL|ContentType|Event|Identifier|MessageType|RequestContent|Action|StatusCode|Csvson|AddifyVariables |
 |:--------------|:--------------|:-----------|:--------------|:--------------|:--------------|:--------------|:-----|:-----|:-----|:-----|:-----|:-----|:-----|:-----|
 |CREATE_CUSTOMER|REST|apiservice|Create Customer |As a user needs to;create customer;details;customer;user;|http://localhost:8800/customer/5|application/json|||| <pre>{ <br/<br >"customerId": "[customerId]",   <br/>  "firstname": "Ronnie",<br/>    "lastname": "Sander"<br/>} <br></pre> |POST|201|```customerId,firstname,lastname```<br>```i~[customerId],Ronnie,Sander```|customerId=TEXT(RANDBETWEEN(2001,5000),"0")|
|VERIFY_CUSTOMER_CREATED_EVENT | KAFKA | proto | Validate created customer event |contains customer information||  | CustomerCreated | [customerId] |ProtoMessageType|| ||```customerId,firstname,lastname```<br>```i~[customerId],Ronnie,Sander```| |

  - TestCaseName 
    -  Test case name which should be unique.

  - Type 
    - "KAFKA" for Events and "REST" for API.

  - Resource 
    - Used for API Endpoint mapping.
    - The kafka broker that should be connected to validate the "CustomerCreated" Event.
    - In this case, "proto" is a resource for this consumer. Now the framework will look for "consumer-proto.properties" in the classpath. Which would help which broker configuration would be used to consume the message.  

      > consumer-proto.properties #  Following values can be substitued by your application specific values.
      ```properties
          bootstrap.servers: microservices.virtualandemo.com:9092
          key.deserializer: org.apache.kafka.common.serialization.StringDeserializer
          value.deserializer: org.apache.kafka.common.serialization.ByteArrayDeserializer
          enable.auto.commit: true
          auto.commit.interval.ms: 1000
          session.timeout.ms: 30000
          auto.offset.reset: earliest
        ```
  - TestCaseNameDesc 
    - Describes the purpose of the test case.

  - StepInfo  
    - Helps create meaningful step definitions for API and Kafka. 
  
  - StoreResponseVariables
    - From the API response and it allows to create multiple variables using key=value; key as "variable name" and value as "jsonpath"    

  - Event 
    - To validate the customer details by retrieving the "CustomerCreated" event from the mapping kafka topic. This kafka topic with the event mapping will be specified in the "topic.properties" file and add the properties file to the classpath.
    
    > topic.properties    
    ```properties
      CustomerCreated: dev01.customerCreated  # CustomerCreated event would be consumed from the "dev01.customerCreated topic"
    ```
  - Identifier 
    - To read the unique event(message) from the given kafka topic. In this case "[customerId]" is the unique customer Id of the "CustomerCreated" event to be validated.

  - Csvson 
    - Comma separated value(csv) of the customer information to be validated. i~ represents integer value.
  -  MessageType 
     - This "ProductCreated" event is protobuf message. Predefined "ProtoMessageType" can be used for this event validation.
     - An entry needs to be added to the "proto-messagetype.properties"
     - The entry should be "\<eventname>=\<Fully-Qualified-Proto-Class-Name>;\<JSONPath>"
     > proto-messagetype.properties
       
  ```properties
    ProductCreated=io.virtualan.proto.cucumblan.Product;productId_
    CustomerCreated=io.virtualan.proto.cucumblan.Customer;customerId_
  ```

3. Create API Executor Plan:

  I. **In the Resource column,** 
      1. which contains "apiservice" - It represents the service Endpoint where the service executed.
      2.  which contains "proto" - It is the resouce of Kafka broker to be connected to read and produce message
      3. Json test scripts and Feature file generated in the "outputDir" directory that is "testscript-generated/customer-proto"
      4. After execution, cucumber report created in the "outputJsonDir" directory that is "target/idaithalam"
  
  II. Create the following yml file under resources with "work-flow.yaml".
  ```yml
    parallelExecution: 4
    timeout:  30000
    apiExecutor:
      - reportTitle: "1. API with Kafka Event Testing With ProtoBuff"
        env: dev
        outputJsonDir: target/idaithalam
        outputDir: testscript-generated/customer-proto
        inputExcel: event-xls/CreateCustomer-Event.xlsx
        cucumblanProperties:
          service.api.apiservice: http://microservices.virtualandemo.com:9001
        consumers:
          proto:
            bootstrap.servers: microservices.virtualandemo.com:9092
            key.deserializer: org.apache.kafka.common.serialization.StringDeserializer
            value.deserializer: org.apache.kafka.common.serialization.ByteArrayDeserializer
            enable.auto.commit: true
            auto.commit.interval.ms: 1000
            session.timeout.ms: 30000
            auto.offset.reset: earliest
        topicProperties:
          CustomerCreated: dev01.customerCreated
  ```
4. Create KafkaTestPlanExecutor to run the test:

   ```java
  package io.virtualan.idaithalam.test;

  import io.virtualan.idaithalam.core.api.VirtualanTestPlanExecutor;
  import org.testng.Assert;

  public class KafkaTestPlanExecutor {

    @org.testng.annotations.Test
    public void execute_CustomerEvent_protobuff_workflow(){
      try {
        boolean isSuccess = VirtualanTestPlanExecutor.invoke("workflow/work-flow-proto.yaml");
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
      <class name="io.virtualan.idaithalam.test.KafkaTestPlanExecutor" />
      </classes>
      </test>
    </suite>
    ```
 
6. Execute the test cases
   > mvn clean install

7. After execution, view the cucumber report under "target/idaithalam". 


