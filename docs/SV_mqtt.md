# MQTT - Virtualization

[![Maven Central](https://img.shields.io/maven-central/v/io.virtualan/virtualization.svg?label=Maven%20Central)](https://search.maven.org/search?q=g:%22io.virtualan%22%20AND%20a:%22virtualization%22)


## What it is
>  Allows to Virtualize/Mocking message for MQTT. Virtualization is a Service virtualization Product and is the simulation of the behavior of Open API that are unavailable or otherwise restricted during the preproduction stage of the software development lifecycle. 
Virtualization has RESTAPI and user-friendly interface (UI) to set up the test data for your specific type of Rest APIs. This UI would help Developer, Functional Tester or Automation Tester to set up the test data for their specific use cases and test scenarios 

## Project setup/Live demo

 |Project|  
 |----------:|
  |[AsyncAPI MQTT Service Virtualization Project](https://github.com/virtualansoftware/asyncapi-virtualization)  |

## Maven dependency
```mvn 
<dependency>
	<groupId>io.virtualan</groupId>
	<artifactId>virtualization</artifactId>
	<version>${virtualan.version}</version>
</dependency>
``` 

## How to Integrate
1. create CONFIG with following format and create file in the classpath under conf/mqtt-config.json   
> "topics" :  Add all topics will consume and then produce mock response message

```JSON
{
  "MQTT" : [
    {
      "systemName": "<Application/Service Name>",
      "broker-url" : ["<broker address1>", "<broker address2>"],
      "receiver-queue": [
          "<queue name1>", "<queue name2>"
      ],
      "username" : "<username>",
      "password" : "<password>",
      "qos" :  <0,1,2>
      "completionTimeout": <30>,
      "cleanSession" : <true | false>,
      "automaticReconnect" : <true | false>,
      "connectionTimeout" : <100>,
      "keepAliveInterval" : <123>
    }
  ]
}
```
**Example Config:**
```JSON
{
  "MQTT" : [
    {
      "systemName": "Virtualan-MQTT-1",
      "broker-url" : ["ssl://ed77617de471420c8f0bf54c661aacae.s2.eu.hivemq.cloud:8883"],
      "username": "virtualan",
      "password" :"Password1",
      "receiver-queue": ["virtualan.input_1", "virtualan.input_2", "virtualan.input_3"],
      "qos" : 2,
      "completionTimeout": 5000,
      "cleanSession" : true,
      "automaticReconnect" : true,
      "connectionTimeout" : 100,
      "keepAliveInterval" : 60

    } ]
}

```

## How to add Mock data
  - Adding Message Mock data via REST API
    - API endpoint: http://localhost:8800/virtualservices/message
    - Http Action: Post

    ```JSON
    {
      "brokerUrl": "ssl://ed77617de471420c8f0bf54c661aacae.s2.eu.hivemq.cloud:8883",
      "requestTopicOrQueueName": "virtualan.input_1",
      "resource": "virtualan.input_1",
      "requestType" : "MQTT",
      "responseTopicOrQueueName": "virtualan.output",
        "input": "{\n    \"category\": {\n        \"id\": 100,\n        \"name\": \"German Shepherd\"\n    },\n    \"id\": 101,\n    \"name\": \"Rocky\",\n    \"photoUrls\": [\n        \"string\"\n    ],\n    \"status\": \"available\",\n    \"tags\": [\n        {\n            \"id\": 101,\n            \"name\": \"brown\"\n        }\n    ]\n}",
        "output": "{\n    \"category\": {\n        \"id\": 100,\n        \"name\": \"German Shepherd\"\n    },\n    \"id\": 101,\n    \"name\": \"Rocky\",\n    \"photoUrls\": [\n        \"string\"\n    ],\n    \"status\": \"available\",\n    \"tags\": [\n        {\n            \"id\": 101,\n            \"name\": \"brown\"\n        }\n    ]\n}"
      }
    ```

  - Adding Message Mock data via UI
    - ![Add Mock](_images/sv/mqtt/mqtt_add_mock.png)


## How to view Mock data
  - View Message Mock data via REST API
    > Access via following rest endpoint ad JSON format: http://localhost:8800/virtualservices

  - View Message Mock data via UI
    ![View Mock](_images/sv/mqtt/view_mock.png)

----
