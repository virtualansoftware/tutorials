# CSVson

[![Maven Central](https://img.shields.io/maven-central/v/io.virtualan/mapson.svg?label=Maven%20Central)](https://search.maven.org/search?q=g:%22io.virtualan%22%20AND%20a:%22mapson%22) 

## 1. What is it:
  CSVson library represents JSON as Comma separted valyes. MAPson provides options to work json as CSV.
  **It removes dependency between Gherkin and Json**. This would **help lot more for Product Owner/Business analysts(Non technical team members) can compare json as csv without knowing** the technical details. Simply knowing the JSON hierarchy.
  
## 2. Maven dependency:
  
  ```mvn 
    <dependency>
      <groupId>io.virtualan</groupId>
       <artifactId>mapson</artifactId>
       <version>${csvson.version}</version>
    </dependency>
  ```  

## 3. Json 

```
{
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
    "name": "Cake",
    "id": "0001",
    "type": "donut",
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

## 4. CSVson for above equivalent Json
> **import** io.virtualan.csvson.Csvson;\
>  **API:**  Csvson.buildCSVson(csvline , contextObject)

```
|ppu,name,topping/id:type,id,type, batters.batter/id:type|
|d~[ppu],Cake,5001:None\|5002:Glazed\|5005:Sugar\|5007:Powdered Sugar\|5006:Chocolate with Sprinkles\|5003:Chocolate\|[TOPPING]:Maple\|,0001,donut,1001:Regular\|1002:Chocolate\|1003:Blueberry\|1004:Devil's Food\| |

```

## 5. MAPson for above equivalent Json

| key                       | value                         |
| ------------------------- | ----------------------------- |
| id                        |  0001                         |
| type                      |  donut                        |
| name                      |  Cake                         |
| ppu                       |   d~[ppu]                     |
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
| topping[6].id             |   [TOPPING]                   |
| topping[6].type           |   Maple                       |


## 6. Gherkin feature file using Mapson and Csvson:

```gherkin
Scenario: Create and validate how to create MAPson data and replace with context value for digit
    Given create a Json with given MAPson input
      | id                        |  0001                         |
      | type                      |  donut                        |
      | name                      |  Cake                         |
      | ppu                       |   d~[ppu]                     |
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
      | topping[6].id             |   [TOPPING]                   |
      | topping[6].type           |   Maple                       |
    And build context object
      | ppu        |   0.55  |
      | TOPPING    |   5004  |
    Then check the Json with context value is Valid
      | key |{"ppu":0.55,"batters":{"batter":[{"id":"1001","type":"Regular"},{"id":"1002","type":"Chocolate"},{"id":"1003","type":"Blueberry"},{"id":"1004","type":"Devil's Food"}]},"name":"Cake","id":"0001","type":"donut","topping":[{"id":"5001","type":"None"},{"id":"5002","type":"Glazed"},{"id":"5005","type":"Sugar"},{"id":"5007","type":"Powdered Sugar"},{"id":"5006","type":"Chocolate with Sprinkles"},{"id":"5003","type":"Chocolate"},{"id":"5004","type":"Maple"}]}|
    Then validate csvson rows
      |ppu,name,topping/id:type,id,type, batters.batter/id:type|
      |d~[ppu],Cake,5001:None\|5002:Glazed\|5005:Sugar\|5007:Powdered Sugar\|5006:Chocolate with Sprinkles\|5003:Chocolate\|[TOPPING]:Maple\|,0001,donut,1001:Regular\|1002:Chocolate\|1003:Blueberry\|1004:Devil's Food\| |
```
## 7. Example

### 7.1 Example : Convert map as json for API testing with context value
> **import** io.virtualan.mapson.Mapson; \
> **API:** MAPson.buildMAPsonAsJson(jsonPathMap, contextMap)
```gherkin
 Scenario: Create and validate for create MAPson from JSON
    Given create a Json with given MAPson input
      | id                      |  0001                         |
      | type                    |  donut                        |
      | name                    |  Cake                         |
      | ppu                     |   d~[ppu]                     |
      | toppings[0]             |   l~5001                      |
      | toppings[1]             |   l~2001                      |
    And build context object
      | ppu |   0.55  |
    Then check the Json with context value is Valid
      | key |{"ppu":0.55,"name":"Cake","toppings":[5001,2001],"id":"0001","type":"donut"}|
    Then validate csvson rows
      |ppu,name,toppings,id,type     |
      |d~0.55,Cake,i~5001\|i~2001\|,0001,donut |
```
> **import** io.virtualan.csvson.Csvson;\
>  **API:**  Csvson.buildCSVson(csvline , contextObject)
```Java
@Then("validate csvson rows$")
public void validateJson(List<String> csvline) throws BadInputDataException {
    JSONArray jsonArray = Csvson.buildCSVson(csvline , contextObject);
    LOGGER.info(jsonArray.toString(2));
    jsonActual = Mapson.buildMAPsonAsJson(mapson, contextObject);
    Assert.assertTrue(VirtualJSONAssert.jAssertObject(jsonArray.optJSONObject(0), new JSONObject(jsonActual), JSONCompareMode.STRICT));
}
```

----