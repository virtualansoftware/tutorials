# Cucumblan-API

[![Maven Central](https://img.shields.io/maven-central/v/io.virtualan/mapson.svg?label=Maven%20Central)](https://search.maven.org/search?q=g:%22io.virtualan%22%20AND%20a:%22cucumblan-api%22) 

## 1. What is it
Cucumblan-api library contains predefined Gherkin step defination for Rest API testing. Cucumblan-api provides options to Test engineer, Manual Testers and Subject Matter Exports write feature files without having development excelency. This would **help lot more for Product Owner/Business analysts(Non technical team members) can create a features without knowing** the technical details. Simply knowing the Step definations.
  
## 2. Maven dependency:
  
  ```mvn 
    <dependency>
      <groupId>io.virtualan</groupId>
       <artifactId>cucumblan-api</artifactId>
       <version>${cucumblan-api.version}</version>
    </dependency>
  ```  
## 3. Predefined GET:

```gherkin
Scenario: <User calls service to READ a pet by its id>**
    Given <pet> with an path param <petId> of <110>
    And add <api> with given header params
      | Accept      | application/json |
    And add <api> with given query params
      | tags        | grey             |
    When <a user> get <application/json> in <pets_petId> resource on <pet>
    Then Verify the status code is <200>
    And Verify across response includes following in the response
      | id          | 110              |
      | name        | GoldFish-GET     |
      | <jsonpath>  | <value>          |
```

## 4. Predefined POST:

```gherkin
Scenario: User calls service to CREATE and Create Pet
    Given Create <a pet> with given input
      | category.id     | i~[petId_post]  |
      | category.name   | Fish-POST       |
      | id              | i~[petId_post]  |
      | name            | GoldFish-POST   |
      |photoUrls[0]     | /fish/          |
      |	status          |available        |
      |tags[0].id       | i~[petId_post]  |
      |tags[0].name     | Fish-POST       |
    When <a user> post <application/json> in <pets> resource on <pet>
    Then Verify the status code is <201>
    And Verify across response includes following in the response
      | id              | [petId_post]    |
      | name            | GoldFish-POST   |
      | <jsonpath>      | <value>         |
```
## 5. Predefined DELETE:

```gherkin
  Scenario: User calls service to DELETE a pet by its id
    Given <pet> with an path param <petId> of <110>
    When <a user> delete <application/json> in <pets_petId> resource on <pet>
    Then Verify the status code is <200>
    And Verify across response includes following in the response
      | id              | 120             |
      | name            | GoldFish-DELETE |
      | <jsonpath>      | <value>         |      
```

## 6. Predefined PUT:

```gherkin
  Scenario: User calls service to PUT and Create Pet
    Given <pet> with an path param <petId> of <130>
    And Update <with mock> data with given input
      | category.id       | i~130         |
      | category.name     | Fish-PUT      |
      | id                | i~130         |
      | name              | GoldFish-PUT  |
      | photoUrls[0]      | /fish/        |
      |	status            |available      |
      |tags[0].id         | i~130         |
      |tags[0].name       | Fish-PUT      |
    When <a user> put <application/json> in <pets_petId> resource on <pet>
    Then Verify the status code is <200>
    And Verify across response includes following in the response
      | id                | 130          |
      | name              | GoldFish-PUT |
      | <jsonpath>        | <value>      |      

```
## 7. Predefined Form Params:
>  And add <api description> with <content-type> given form params \
>   | key           | value         |

```gherkin
  Scenario: post API Testing - POST api call with form parameters
    Given <a user> perform a api action
    And Add the <[petId]> value of the key as <Id>
    And Add the <doggie> value of the key as <petName>
    And add <request> with <application/x-www-form-urlencoded> given form params
      | id          | 100                               |
      | name        | doggie                            |
    And add request with given header params
      | contentType | application/x-www-form-urlencoded |
      | Accept      | application/json                  |
    When <a user> post <application/x-www-form-urlencoded> in </api/pets> resource on <api>
    Then Verify the status code is <200>
```

## 8. Store response variables:
>  And Store the <json-path> value of the key as <Variable-Name> \
>  And Store the <header-name> value of the key as <Variable-Name> \
>  And Store the <cookie-name> value of the key as <Variable-Name> 
   
```gherkin
  Scenario: get API testing - GET api call
    Given <a user> perform a api action
    And <add request> with given query params
      | tags | [tag] |
    And <add request> with given header params
      | contentType | application/json |
    When <a user> get <application/json> in </api/pets/findByTags> resource on <api>
    Then Verify the status code is <200>
    And Verify-all </api/pets/findByTags> api includes following in the response
      | photoUrls[0]  | string    |
      | name          | Butch     |
      | id            | i~201     |
      | category.name | Bulldog   |
      | category.id   | i~200     |
      | status        | available |
      | tags[0].name  | grey      |
      | tags[0].id    | i~201     |
    And Store the <id> value of the key as <petId>
    And Store the <name> value of the key as <petName>
    And Store the <category.name> value of the key as <category_name>
```

## 9. Create variable
> And Add the <[petId]> value of the key as <Id> /
> And Add the <doggie> value of the key as <petName>
  
```gherkin
  Scenario: post API Testing - POST api call
    Given <a user> perform a api action
    And Add the <[petId]> value of the key as <Id>
    And Add the <doggie> value of the key as <petName>
    And <add request> with given header params
      | contentType | application/json |
    And <Create api> with given input
      | photoUrls[0]  | string    |
      | name          | [petName] |
      | id            | i~100     |
      | category.name | string    |
      | category.id   | i~100     |
      | status        | available |
      | tags[0].name  | string    |
      | tags[0].id    | i~0       |
    When <a user> post <application/json> in </api/pets> resource on <api>
    Then Verify the status code is <200>
```

## 10. Add basic authentication:
> And basic authentication with <username> and <password> / 
> And basic authentication with [basic_auth_user_id.api] and [basic_auth_password.api] 
  
```gherkin
  Scenario: get API testing - GET api call
    Given <a user> perform a api action
    And basic authentication with <[basic_auth_user_id.api]> and <[basic_auth_password.api]>
    And <add request> with given query params
      | tags | [tag] |
    And <add request> with given header params
      | contentType | application/json |
    When <a user> get <application/json> in </api/pets/findByTags> resource on <api>
    Then Verify the status code is <200>
```

## 11. Add Okta authentication:
>  And Bearer auth with [AccessToken.{{{resource}}}] token 
  
```gherkin
Scenario: Read the API token for {{{resource}}}
    Given a user perform a api action
    And basic authentication with [okta_user_id.{{{resource}}}] and [okta_user_password.{{{resource}}}]
    When a user post application/json in api_token resource on okta_token.{{{resource}}}
    Then Verify the status code is 200
    And Store the access_token value of the key as AccessToken.{{{resource}}}
Given a user perform a api action
    And Bearer auth with [AccessToken.{{{resource}}}] token
    And Add the <doggie> value of the key as <petName>
    And <add request> with given header params
    | contentType | application/json |
    And <Create api> with given input
    | photoUrls[0]  | string    |
    | name          | [petName] |
    | id            | i~100     |
    | category.name | string    |
    | category.id   | i~100     |
    | status        | available |
    | tags[0].name  | string    |
    | tags[0].id    | i~0       |
    When <a user> post <application/json> in </api/pets> resource on <api>
    Then Verify the status code is <200>    
```

## 7. Predefined Verify steps:

### 7.1 Verify with json path:
> And Verify (.*) includes following in the response

```gherkin
Scenario: post API Testing - POST api call
    Given <a user> perform a api action
    And Add the <[petId]> value of the key as <Id>
    And Add the <doggie> value of the key as <petName>
    And <add request> with given header params
      | contentType | application/json |
    And <Create api> with given input
      | photoUrls[0]  | string    |
      | name          | [petName] |
      | id            | i~100     |
      | category.name | string    |
      | category.id   | i~100     |
      | status        | available |
      | tags[0].name  | string    |
      | tags[0].id    | i~0       |
    When <a user> post <application/json> in </api/pets> resource on <api>
    Then Verify the status code is <200>
    And Verify <across response> includes following in the response
      | name           | [petName] |
      | id             | 100       |
      | <jsonpath>     | <value>   |      

```

### 7.2 Verify with Mapson  jsonpath way:
> And Verify-all (.*) api includes following in the response

```gherkin
  Scenario: get API testing - GET api call
    Given <a user> perform a api action
    And <add request> with given query params
      | tags | [tag] |
    And <add request> with given header params
      | contentType | application/json |
    When <a user> get <application/json> in </api/pets/findByTags> resource on <api>
    Then Verify the status code is <200>
    And Verify-all </api/pets/findByTags> api includes following in the response
      | photoUrls[0]  | string    |
      | name          | Butch     |
      | id            | i~201     |
      | category.name | Bulldog   |
      | category.id   | i~200     |
      | status        | available |
      | tags[0].name  | grey      |
      | tags[0].id    | i~201     |
```

### 7.3 Verify:
>  And Verify (.*) response inline includes in the response

```gherkin
  Scenario: xml testing - POST api call
    Given a user perform a api action
    And add request with given header params
      | contentType | application/xml |
    And add request data inline with text/xml given input
      | <?xml version="1.0" encoding="utf-8"?>                                                                                                                                    |
      | <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"> |
      | <soap:Body>                                                                                                                                                               |
      | <CelsiusToFahrenheit xmlns="https://www.w3schools.com/xml/">                                                                                                              |
      | <Celsius>100</Celsius>                                                                                                                                                    |
      | </CelsiusToFahrenheit>                                                                                                                                                    |
      | </soap:Body>                                                                                                                                                              |
      | </soap:Envelope>                                                                                                                                                          |
    When a user post text/xml in /xml/tempconvert.asmx resource on xml
    Then Verify the status code is 200
    And Verify api response inline includes in the response
      | <?xml version="1.0" encoding="utf-8"?>                                                                                                                                    |
      | <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"> |
      | <soap:Body>                                                                                                                                                               |
      | <CelsiusToFahrenheitResponse xmlns="https://www.w3schools.com/xml/">                                                                                                      |
      | <CelsiusToFahrenheitResult>212</CelsiusToFahrenheitResult>                                                                                                                |
      | </CelsiusToFahrenheitResponse>                                                                                                                                            |
      | </soap:Body>                                                                                                                                                              |
      | </soap:Envelope>                                                                                                                                                          |


```

### 7.4 Verify:
```gherkin
    And Verify (.*) response csvson includes in the response    
```

### 7.5 Verify:
```gherkin
    And Verify (.*) response (.*) include byPath (.*) includes in the response
```

### 7.6 Verify:
```gherkin
    And Verify (.*) response with (.*) includes in the response
```

### 7.7 Verify:
```gherkin
    And Verify (.*) response XML File (.*) includes in the response
```

### 7.8 Verify:
```gherkin
    And Verify-standard (.*) all inline (.*) api includes following in the response
```

### 7.9 Verify:
```gherkin
    And Verify-standard (.*) all (.*) file (.*) api includes following in the response
```

## Non standard respons support 
The process to redefine the unstandard responses as JSON and compared with Actula response. Little coding needed for unstandard response. Like EDI response. EDI is not a standard reponse but can be compared like JSON to valdiate the data with Actual response. Example value: VirtualanStdType=EDI-271  [EDI270And271Parser](https://raw.githubusercontent.com/virtualansoftware/idaithalam/master/samples/idaithalam-excel-apitesting/src/test/java/io/virtualan/cucumblan/standard/EDI270And271Parser.java)   
 
>    And add request with given header params    \
>        | contentType       | application/xml  |  \
>        | **VirtualanStdType**  | **EDI-271**          | 

```gherkin
    Scenario: EDI-271 API test - POST api call
      Given a user perform a api action
      And Add the grey value of the key as tag
      And add request with given header params
        | contentType                   | application/xml                         |
        | VirtualanStdType                   | EDI-271                         |
       And add request data inline with text/xml given input
        | <?xml version="1.0" encoding="utf-8"?> |
        | <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"> |
        | <soap:Body> |
        | <request> |
        | ISA*00*Authorizat*00*Security I*ZZ*Interchange Sen*ZZ*Interchange |
        | Rec*141001*1037*^*00501*000031033*0*T*:~ |
        | GS*HS*Sample Sen*Sample Rec*20141001*1037*123456*X*005010X279A1~ |
        | ST*270*1234*005010X279A1~ |
        | BHT*0022*13*10001234*20141001*1319~ |
        | HL*1**20*1~ |
        | NM1*PR*2*ABC COMPANY*****PI*842610001~ |
        | HL*2*1*21*1~ |
        | NM1*1P*2*BONE AND JOINT CLINIC*****XX*1234567893~ |
        | HL*3*2*22*0~ |
        | TRN*1*93175-0001*9877281234~ |
        | NM1*IL*1*SMITH*ROBERT****MI*11122333301~ |
        | DMG*D8*19430519~ |
        | DTP*291*D8*20141001~ |
        | EQ*30~ |
        | SE*13*1234~ |
        | GE*1*123456~ |
        | IEA*1*000031033~ |
        | </request> |
        | </soap:Body> |
        | </soap:Envelope> |
      When a user post text/xml in /bin/3f64e65d-c657-42d5-bcc9-5b13e71ca493 resource on bin
      Then Verify the status code is 200
      And Verify-standard EDI-271 all inline /bin/3f64e65d-c657-42d5-bcc9-5b13e71ca493 api includes following in the response
        | <soap:envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"> |
        | <soap:body> |
        | <request> |
        | ISA*00*Authorizat*00*Security I*ZZ*Interchange Sen*ZZ*Interchange Rec*141001*1037*^*00501*000031033*0*T*:~ |
        | GS*HS*Sample Sen*Sample Rec*20141001*1037*123456*X*005010X279A1~ |
        | ST*270*1234*005010X279A1~ |
        | BHT*0022*13*10001234*20141001*1319~ |
        | HL*1**20*1~ |
        | NM1*PR*2*ABC COMPANY*****PI*842610001~ |
        | HL*2*1*21*1~ |
        | NM1*1P*2*BONE AND JOINT CLINIC*****XX*1234567893~ |
        | HL*3*2*22*0~ |
        | TRN*1*93175-0001*9877281234~ |
        | NM1*IL*1*SMITH*ROBERT****MI*11122333301~ |
        | DMG*D8*19430519~ |
        | DTP*291*D8*20141001~ |
        | EQ*30~ |
        | SE*13*1234~ |
        | GE*1*123456~ |
        | IEA*1*000031033~ |
        | </request> |
        | </soap:body> |
        | </soap:envelope> |
```

----