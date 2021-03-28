# MAPson

[![Maven Central](https://img.shields.io/maven-central/v/io.virtualan/mapson.svg?label=Maven%20Central)](https://search.maven.org/search?q=g:%22io.virtualan%22%20AND%20a:%22mapson%22) 

## 1. What is it
MAPson library represents JSON as MAP with key as Json-Path. MAPson provides options to work json as MAP. **It removes dependency between Gherkin and Json**. This would **help lot more for Product Owner/Business analysts(Non technical team members) can create a features without knowing** the technical details. Simply knowing the JSON hierarchy.
  
## 2. Maven dependency:
  
  ```mvn 
    <dependency>
      <groupId>io.virtualan</groupId>
       <artifactId>mapson</artifactId>
       <version>${mapson.version}</version>
    </dependency>
  ```  
## 3. JSON:
  
```json 
 {
  {
    "id": "0001",
    "type": "donut",
    "name": "Cake",
    "ppu": 0.55,
    "batters": {
    "batter": [
      {
            "id": "1001",
            "type": "Regular"
          },
          {
            "id": "1002",
            "type": "Chocolate"
          },
          {
            "id": "1003",
            "type": "Blueberry"
          },
          {
            "id": "1004",
            "type": "Devil's Food"
          }
        ]
      },
      "topping": [
        {
          "id": "5001",
          "type": "None"
        },
        {
          "id": "5002",
          "type": "Glazed"
        },
        {
          "id": "5005",
          "type": "Sugar"
        },
        {
          "id": "5007",
          "type": "Powdered Sugar"
        },
        {
          "id": "5006",
          "type": "Chocolate with Sprinkles"
        },
        {
          "id": "5003",
          "type": "Chocolate"
        },
        {
          "id": "5004",
          "type": "Maple"
        }
      ]
    }
```    
    
## 4. MAPson for above equivalent Json:

  | key  | value |
  | ---------- | ----- |
  | id                        |  0001	                        |
  | type                      |  donut                        |
  | name                      |  Cake                         |
  | ppu	                      |   d~0.55                      |
  | batters.batter[0].id      |   1001                        |
  | batters.batter[0].type    |   Regular                     |
  | batters.batter[1].id      |   1002                        |
  | batters.batter[1].type    |   Chocolate                   |
  | batters.batter[2].id      |   1003                        |
  | batters.batter[2].type    |   Blueberry                   |
  | batters.batter[3].id      |   1004                        |
  | batters.batter[3].type    |   Devil's Food                |
  | topping[0].id             |   5001                        |
  | topping[0].type           |   None                        |
  | topping[1].id             |   5002                        |
  | topping[1].type           |   Glazed                      |
  | topping[2].id             |   5005                        |
  | topping[2].type           |   Sugar                       |
  | topping[3].id             |   5007                        |
  | topping[3].type           |   Powdered Sugar              |
  | topping[4].id             |   5006                        |
  | topping[4].type           |   Chocolate with Sprinkles    |
  | topping[5].id             |   5003                        |
  | topping[5].type           |   Chocolate                   |
  | topping[6].id             |   5004                        |
  | topping[6].type           |   Maple                       |
   
## 5. Example

#### 5.1 Example 1: Convert map as json for API testing 
**API:** MAPson.buildMAPsonAsJson(jsonPathMap)

```gherkin
 Given create a Json with given MAPson input
      | id                        |  0001                         |
      | type                      |  donut                        |
      | name                      |  Cake                         |
      | ppu                       |   d~0.55                      |
      | batters.batter[0].id      |   1001                        |
      | batters.batter[0].type    |   Regular                     |
      | batters.batter[1].id      |   1002                        |
      | batters.batter[1].type    |   Chocolate                   |
      | batters.batter[2].id      |   1003                        |
      | batters.batter[2].type    |   Blueberry                   |
      | batters.batter[3].id      |   1004                        |
      | batters.batter[3].type    |   Devil's Food                |
      | topping[0].id             |   5001                        |
      | topping[0].type           |   None                        |
      | topping[1].id             |   5002                        |
      | topping[1].type           |   Glazed                      |
      | topping[2].id             |   5005                        |
      | topping[2].type           |   Sugar                       |
      | topping[3].id             |   5007                        |
      | topping[3].type           |   Powdered Sugar              |
      | topping[4].id             |   5006                        |
      | topping[4].type           |   Chocolate with Sprinkles    |
      | topping[5].id             |   5003                        |
      | topping[5].type           |   Chocolate                   |
      | topping[6].id             |   5004                        |
      | topping[6].type           |   Maple                       |
```

```java
@Given("create a Json with given MAPson input")
public void validateJson(Map<String, String> jsonPathMap) {
    String jsonActual = MAPson.buildMAPsonAsJson(jsonPathMap);
    Assert.assertEquals(JsonExpected.get("key"), jsonActual);
}
```

#### 5.2 Example 2: Convert map as json for API testing with context value
> **import** io.virtualan.mapson.Mapson; \
> **API:** MAPson.buildMAPsonAsJson(jsonPathMap, contextMap)

```gherkin
Scenario: Create and validate how to create MAPson data and replace with context value
    Given create a Json with given MAPson input
      | url                   | /pets              |
      | input                 |  Fish              |
      | output                |  Gold-Fish         |
      | httpStatusCode	      |   201              |
      | method                |   [action]         |
    And build context object
      | action                |   POST             |
    Then check the Json with context value is Valid
      | key | {"output":"Gold-Fish","input":"Fish","method":"POST","url":"/pets","httpStatusCode":"201"}|
```

```Java
@Then("check the Json with context value is Valid")
public void validateJsonWithContext(Map<String, String> JsonExpected) throws BadInputDataException {
    String jsonActual = MAPson.buildMAPsonAsJson(mapson, contextMap);
    Assert.assertEquals(JsonExpected.get("key"), jsonActual);
}
```
## 6. Reference

### 6.1 Feature File: 
[mapson.feature](https://github.com/virtualansoftware/mapson/blob/develop/src/test/resources/features/mapson.feature)

### 6.2 StepDefinition File: 
[MapsonStepDefinition.java](https://github.com/virtualansoftware/mapson/blob/develop/src/test/java/io/virtualan/mapson/step/MapsonStepDefinition.java)
 
 ----