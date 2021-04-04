# Cucumblan-UI

[![Maven Central](https://img.shields.io/maven-central/v/io.virtualan/cucumblan-ui.svg?label=Maven%20Central)](https://search.maven.org/search?q=g:%22io.virtualan%22%20AND%20a:%22cucumblan-ui%22) 

## What is it
Cucumblan-ui library contains predefined Gherkin step defination for UI testing. Cucumblan-ui provides options to Test engineer, Manual Testers and Subject Matter Exports write feature files without having development excelency. This would **help lot more for Product Owner/Business analysts(Non technical team members) can create a features without knowing** the technical details. Simply knowing the Step definations.
  
## Maven dependency:
```mvn 
<dependency>
    <groupId>io.virtualan</groupId>
    <artifactId>cucumblan-ui</artifactId>
    <version>${cucumblan-ui.version}</version>
</dependency>
```  
## How to Integrate: 
1. cucumblan.properties  - Should be added in classpath

> service.ui.**/<RESOURCE>**=http://servername:xxxx/abc-ui \
> action-package==\<PACKANGE IMPL>

```properties
    service.ui.virtualan=http://localhost:8800/virtualan-ui
    action-package=io.virtualan.cucumblan.ui.actionimpl
```

2. cucumblan-env.properties
> Pre defined variables to be populated with data required for api execution. like password for the api.
```properties
okta_user_id=test
okta_user_password=change
basic_auth_user_id.api=test
basic_auth_password.api=test
```

3. How to define a page 

> login.page

```
1=Username<~~>SET_TEXT<~~>//input[@name='email']<~~>DATA
2=Password<~~>SET_TEXT<~~>//input[@name='password']<~~>DATA
3=Login<~~>CLICK<~~>//button[text()='Log in']<~~>NAVIGATION
```

## Project setup and Live demo link
> UI TESTING  - https://github.com/virtualansoftware/cucumblan/tree/master/samples/cucumblan-lakesidemutual-uitesting 

## Predefined Page action:

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

