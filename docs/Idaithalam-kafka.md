Test Case: Validate the order creation API and new ordered creation event

As a user, I need to validate the Order Created  event. The OrderCreated will contains an unique order number, Product details, and Customer information. Reterive and Validate the order deatils from order created event by order id.

## Steps to perfom the testcase: 


1. Create Java project


2. Create excel with given format for REST api and Kafka event validation 
   save the file under resources as createOrder_API_with_OrderCreated_Event.xlsx

   |TestCaseName|Type|Resource|TestCaseNameDesc|StepInfo|URL|ContentType|Event|Identifier|MessageType|RequestContent|Action|StatusCode|StoreResponseVariables|Csvson|
    |:--------------|:--------------|:-----------|:--------------|:--------------|:--------------|:--------------|:-----|:-----|:-----|:-----|:-----|:-----|:-----|:-----|
    |CREATE_ORDER|REST|orderservice|Create order|As a user needs to;create order;details;order;user;|http://localhost:8800/order/5|application/json|||| <pre>{ "customer": { <br>     "customerId": 1001,<br>     "firstname": "Ronnie",<br>     "lastname": "Sander"<br>   },<br>   "orderDesc": "Order Dell Laptop",<br>   "orderStatus": "Started",<br>   "purchasedProducts": [<br>     {<br>       "productId": 901,<br>       "productName": "Dell Inspiron 3583 15",<br>       "productDesc": "Laptop Intel Celeron – 128GB SSD – 4GB DDR4 – 1.6GHz - Intel UHD Graphics 610 - Windows 10 Home in S Mode - Inspiron 15 3000 Series"<br>     }<br>   ]<br> }<br></pre> |POST|201|orderId=orderNumber|```orderDesc,orderStatus,customer/customerId:firstname:lastname,orderStatus```<br>```Order Dell Laptop,Started,i~1001:Ronnie:Sander,Started```|
    |VERIFY_ORDER_CREATED_EVENT | KAFKA | order | Validate Insurance user event |contains user information||  | OrderCreated | [orderId] |OrderMessageType|| ||| ```orderNumber,orderDesc,orderStatus,customer/customerId:firstname:lastname,orderStatus```<br>```[orderId],Order Dell Laptop,Started,i~1001:Ronnie:Sander,Started```| 

    - TestCaseName 
        -  Test case name which should be unique.
    
    - Type 
        - "KAFKA" for Event and "REST" for API.

    - Resource 
        - Used for API End Point mapping 
        - The kafka broker that should be connected to validate the "OrderCreated" Event.

    - TestCaseNameDesc 
        - Describes the purpose of the test case.

    - StepInfo  
        - Helps create meaningful step definitions for API and Kafka. 
    
    - Event 
        - To validate the order details by retreving the "OrderCreated" event from the mapping kafka topic. This kafka topic with the event mapping will be specified in the "topic.properties" file and add the proprties file to the classpath.
            
            > topic.properties
                OrderCreated=dev01.orderCreated
                CreateQuote=dev01.createQuote

    -  Identifier 
        - To identify the unique event(message) from the given kafka topic. In this case "[orderId]" is unique order number of the "OrderCreated" event to be validated.

    - Csvson 
        - Comma separated value(csv) of the order information to be validated. i~ represents integer value.

    -  MessageType 
        - Each kafka topic has its own set of events (messages). Each event will have different set of fields.
        Example: "OrderCreated" event have the user specific fields. But CreateQuote event will have different set of quote specfic fields. 
        - Implement OrderMessageType
        Lets define the new message type for "OrderCreated" event and name as "OrderMessageType". In Idaithalam, all data verification perfomed as JSON. This handler will parse the event(meassage) and build "OrderMessageType" object with Identifier, JSON. 
        
            - ****Following methods need to be implemented****    
                
                - MessageType buildConsumerMessage(ConsumerRecord<T, TT> record, T key, TT value) throws MessageNotDefinedException;
                    
                    This method will parse the consumed event and build the messageType with identifier and specific MessageType Object. It is a mandatory for event verification

                > Example:   
                >    ```JAVA
                        public io.virtualan.cucumblan.message.type.MessageType buildConsumerMessage(
                            org.apache.kafka.clients.consumer.ConsumerRecord<String, String> record, String key, String body) 
                                    throws io.virtualan.cucumblan.message.exception.MessageNotDefinedException {
                            org.json.JSONObject object = new org.json.JSONObject(body);
                            String id = object.getString("orderNumber");        //Retrieve the Identifier
                            object.put("partitionId", record.partition());      //Showcase accessing Kafka headers - partition
                            object.put("kafka-topic-name", record.topic());     //Showcase accessing Kafka headers - topic name
                            return new OrderMessageType(id, object.toString()); //Build the OrderMessageType
                        }
                        org.apache.kafka.clients.consumer.ConsumerRecord<String, String> record = Kafka consumer record. 
                            - Key as String   
                            - value as String 
                        String key - represent the kafka message key
                        String body - represent the kafka message value
                 ```
                - public String getId()  
                    This method should be implemented to return the identifier.It is also a mandatory method.

                > Example:
                > ````JAVA
                    //Mandatory
                    public String getId() {
                        return this.id; //return the identifier for the event.
                    }       
                ````
                - public org.json.JSONObject getMessageAsJson()
                    This method should be implemented to return JSON Object.It is also a mandatory method.
                
                > Example:
                > ````JAVA
                //Mandatory
                public org.json.JSONObject getMessageAsJson() {
                    return new org.json.JSONObject(this.body); //return JSON Object if not have to build one.
                }       
                ````
                - public io.virtualan.cucumblan.message.type.MessageType buildProducerMessage(Object messages) throws io.virtualan.cucumblan.message.exception.MessageNotDefinedException  
                This method only needed for producing a event. Not a mandatory method for a event verification.   

> **Build Consumer Message**
To validate the event, the event should be read and stored by the identifier. Have to implement handler the following method which suppose to split the user infomation by user identifier. 
Generate message type based on application specific needs using the following method in the message factory\

**Example OrderMessageType implementation**
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
