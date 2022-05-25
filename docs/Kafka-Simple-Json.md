## Json message validation: 

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
         ```properties
         bootstrap.servers=microservices.virtualandemo.com:9092 # kafka broker
         key.deserializer=org.apache.kafka.common.serialization.StringDeserializer
         value.deserializer=org.apache.kafka.common.serialization.StringDeserializer
         enable.auto.commit=true
         auto.commit.interval.ms=1000
         session.timeout.ms=30000
         auto.offset.reset=earliest   
        ```
  - TestCaseNameDesc 
    - Describes the purpose of the test case.

  - StepInfo  
    - Helps create meaningful step definitions for API and Kafka. 
  
  - StoreResponseVariables
    - From the API response and it allows to create multiple variables using key=value; key as "variable name" and value as "jsonpath"    

  - Event 
    - To validate the order details by retrieving the "OrderCreated" event from the mapping kafka topic. This kafka topic with the event mapping will be specified in the "topic.properties" file and add the properties file to the classpath.
    
    > topic.properties    
    
    ```properties
    OrderCreated=dev01.orderCreated  # OrderCreated event would be consumed from the "dev01.orderCreated topic"
    CreateQuote=dev01.createQuote  # CreateQuote event would be consumed from the "dev01.createQuote topic"
    ```
  - Identifier 
    - To read the unique event(message) from the given kafka topic. In this case "[orderId]" is the unique order number of the "OrderCreated" event to be validated.

  - Csvson 
    - Comma separated value(csv) of the order information to be validated. i~ represents integer value.
  -  MessageType 
     - This "OrderCreated" event is JSON message. Predefined "JSONMessageType" can be used for this event validation.
     - An entry needs to be added to the "json-messagetype.properties"
     - The entry should be "\<eventname>=\<JSONPath>"
     
     > json-messagetype.properties
       
    ```properties
    OrderCreated=orderNumber  # "orderNumber" is the json path of the "OrderCreated" Event and the value of the "orderNumber" is used to uniquely identify the event
    ```

3. Create API Executor Plan:
    
  I. **In the Resource column,**   
      1. which contains "orderservice" - It represents the service Endpoint where the service executed.
      2.  which contains "json" - It is the resouce of Kafka broker to be connected to read and produce message
      3. Json test scripts and Feature file generated in the "outputDir" directory that is "target/message"
      4. After execution, cucumber report created in the "outputJsonDir" directory that is "target/idaithalam"

  II. Create the following yml file under resources with "work-flow.yaml".
    
    ```yml
    parallelExecution: 4
    timeout:  3 
    apiExecutor:
      - reportTitle: "API with Kafka Event Testing"
        env: dev
        <outputJsonDir>: target/idaithalam
        <outputDir>: testscript-generated/order
        inputExcel: event-xls/CreateOrder-Event.xlsx
        cucumblanProperties:
          service.api.<orderservice>: http://microservices.virtualandemo.com:9001
        consumers:
          <json>:
            bootstrap.servers: microservices.virtualandemo.com:9092
            key.deserializer: org.apache.kafka.common.serialization.StringDeserializer
            value.deserializer: org.apache.kafka.common.serialization.StringDeserializer
            enable.auto.commit: true
            auto.commit.interval.ms: 1000
            session.timeout.ms: 30000
            auto.offset.reset: earliest
        producers:
          <json>:
            bootstrap.servers: microservices.virtualandemo.com:9092
            key.serializer: org.apache.kafka.common.serialization.StringSerializer
            value.serializer: org.apache.kafka.common.serialization.StringSerializer
        topicProperties:
          OrderCreated: dev01.orderCreated
    ```
4. Create KafkaTestPlanExecutor to run the test:

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