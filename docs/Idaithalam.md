# Idaithalam - Lowcode Test Automation

[![Maven Central](https://img.shields.io/maven-central/v/io.virtualan/idaithalam.svg?label=Maven%20Central)](https://search.maven.org/search?q=g:%22io.virtualan%22%20AND%20a:%22idaithalam%22) 
                          
## What is it: 

Idaithalam is a low code Test automation Framework,  developed using Java and Cucumber. It leverages Behavior Driven Development (BDD). Tester can create test cases/scripts in simple Excel with API Spec. Excel is a simplified way to create Json based test scripts in Idaithalam. Test cases can be created quickly and tested in minutes.


As a tester, you need to create Excel and pass it to Idaithalam Framework. 

1. First, generate the Json based test scripts(Virtualan Collection) from Excel. During test execution, this test script collection can be directly utilized.  
2. Then it generates Feature files from the Virtualan Collection and its executed.
3. Lastly, It generates test report in BDD/Cucumber style. 


This provide complete testing support for REST APIs, GraphQL, RDBMS DB and Kafka Event messages

#idaithalam #apitesting #testautomation #restapitesting #insprintautomation #rdbmstesting #graphqltesting #kafkamessagetesting #eventvalidation #messagevalidation #cucumber #bdd

**Virtualan Collection is a JSON based TestScripts generated from Excel**

## Maven dependency: 
  
  ```mvn 
    <dependency>
      <groupId>io.virtualan</groupId>
       <artifactId>idaithalam</artifactId>
       <version>${idaithalam.version}</version>
    </dependency>
  ```  


## Architecture

![](_images/idaithalam/Architecture.png ':size=65%')


## How it works

![](_images/idaithalam/Workflow.png ':size=65%')


## Simplified Demo Projects 
  -  [Rest-Get](https://github.com/virtualansoftware/microservices-lowcode-testautomation/tree/main/rest-get)
  -  [Rest-Post](https://github.com/virtualansoftware/microservices-lowcode-testautomation/tree/main/rest-post)
  -  [Rest-with-DB](https://github.com/virtualansoftware/microservices-lowcode-testautomation/tree/main/rest-with-db)
  -  [Workflow-Rest](https://github.com/virtualansoftware/microservices-lowcode-testautomation/tree/main/workflow-rest)
  -  [DB](https://github.com/virtualansoftware/microservices-lowcode-testautomation/tree/main/db)
  -  [Examples](https://github.com/virtualansoftware/microservices-lowcode-testautomation/tree/main/examples)
  -  [Generate-Feature-File](https://github.com/virtualansoftware/microservices-lowcode-testautomation/tree/main/generate-feature-file)
  -  [Execute-Feature-File](https://github.com/virtualansoftware/microservices-lowcode-testautomation/tree/main/execute-feature-file)
  -  [Workflow-virtualan-collection-Rest](https://github.com/virtualansoftware/microservices-lowcode-testautomation/tree/main/workflow-virtualan-collection-rest)
  -  [Graphql](https://github.com/virtualansoftware/microservices-lowcode-testautomation/tree/main/graphql)
  -  [Microservices-lowcode-testautomation Projects](https://github.com/virtualansoftware/microservices-lowcode-testautomation) 


## Video Tutorials
<details><summary>Toggle me!</summary>


| Name   |      Link      |  level |
|----------|:-------------|------:|
| What is ? | [What is Idaithalam](https://www.youtube.com/watch?v=6cz85yyVv58&list=PLXbcghgSZDrr2loEsuHEHNy_0iEj6zeso)| Beginner |
| How to ? | [How to setup Idaithalam](https://www.youtube.com/watch?v=6cz85yyVv58&list=PLXbcghgSZDrr2loEsuHEHNy_0iEj6zeso)| Beginner |
| Contract testing? | [ How to perform Data Contract ](https://www.youtube.com/watch?v=zi_TJ474Nmw&list=PLXbcghgSZDrr2loEsuHEHNy_0iEj6zeso&index=3)| Beginner |
| is it Data Driven? | [How to perform Data Driven Testing](https://www.youtube.com/watch?v=Ft3lvuJeaCs&list=PLXbcghgSZDrr2loEsuHEHNy_0iEj6zeso&index=4)| Beginner |
| How to make Orchestration of APIs? | [Orchestration of APIs](https://www.youtube.com/watch?v=iLxKfDky3_0&list=PLXbcghgSZDrr2loEsuHEHNy_0iEj6zeso&index=5)| Beginner |
| Execute API tests in Multiple Environment | [Multiple Environment](https://www.youtube.com/watch?v=VZuhxd3TamU&list=PLXbcghgSZDrr2loEsuHEHNy_0iEj6zeso&index=6)| Beginner |
| Use variables and validate the response | [Use variables](https://www.youtube.com/watch?v=1vD2SD866l4&list=PLXbcghgSZDrr2loEsuHEHNy_0iEj6zeso&index=8)| Beginner |
| Basic Auth | [Basic Auth](https://www.youtube.com/watch?v=LOQ3nhJLQCQ&list=PLXbcghgSZDrr2loEsuHEHNy_0iEj6zeso&index=9)| Beginner |
| Perform Database Testing 1 | [Perform Database Testing](https://www.youtube.com/watch?v=AInS1HbkR70&list=PLXbcghgSZDrr2loEsuHEHNy_0iEj6zeso&index=11)| Beginner |
| Perform Database Testing 2 | [perform Database Testing](https://www.youtube.com/watch?v=QKTSO6PWPQc&list=PLXbcghgSZDrr2loEsuHEHNy_0iEj6zeso&index=10)| Beginner |



</details>

## How to Integrate: 

Download Example Project Explained: [REST GET API](https://github.com/virtualansoftware/microservices-lowcode-testautomation/tree/main/rest-get)

1. Create Java project
  
    ![](_images/idaithalam/project_structure.jpg ':size=30%')

    

2. Create excel with given format for REST api testing 
   save the file under resources/rest as rest-get.xlsx

    |TestCaseName|Type| Resource|TestCaseNameDesc|URL|ContentType|Action|StatusCode|
    | -----------|:--------------:|:--------------:|:--------------:| -----:| -----:| -----:| -----:|
    | PetGet | REST | ep | get API testing|https://localhost/pets/findByTags?tags=red|application/json|GET|200|

    More row representation example:
    ![](_images/idaithalam/Sample-XL.png ':size=100%')


3. Create API Executor Plan:
Create following yml file under resources with rest-get.yml
>  In the Resource column, which contains "ep". It represents the service Endpoint in the yml file where service executed.
>  Json test scripts and Feature file created in the "outputDir" directory that is "target/rest-get"
>  After execution, cucumber report created in the "outputJsonDir" directory that is "target/idaithalam"

  ```yml
  parallelExecution: 1
  timeout:  1 
  apiExecutor:
    - reportTitle: "REST GET Example"
      env: test
      outputDir: target/rest-get
      inputExcel: rest/rest-get.xlsx
      outputJsonDir: target/idaithalam
      cucumblanProperties:
        service.api.ep: https://live.virtualandemo.com/api
  ```

4. Create RestTestPlanExecutor to run the test:

    ```java
    package io.virtualan.test.demo;

    import io.virtualan.idaithalam.core.api.VirtualanTestPlanExecutor;
    import org.testng.Assert;
    import org.testng.annotations.Test;

    @Test
    public class RestTestPlanExecutor {
      @Test
      public void workflowExecution_xl() {
        try {
          boolean isSuccess = VirtualanTestPlanExecutor
                  .invoke("rest-get.yml");
          Assert.assertTrue(isSuccess);
        } catch (InterruptedException e) {
          Assert.assertTrue(false);
        }
      }

    }

    ```
5. Create testng Test plan 

    ```xml
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE suite SYSTEM "http://testng.org/testng-1.0.dtd">
      <suite name="End-2-End API automation Suite">
          <test name="End-2-End API automation Suite" >
              <classes >
                  <class name="io.virtualan.test.demo.RestTestPlanExecutor" />
              </classes>
          </test>
      </suite>
    ```
6. Execute the test cases

  > mvn clean install

7. After execution, view the cucumber report under "target/idaithalam"

8. Thank you for visiting us! 
    



## Used for API testing.
* Most of the common use case, You can execute as Regression test suite for the test case executed manually via POSTMAN.
* Run the testcase via POSTMAN and store the response as Example with response data in the POSTMAN for all the test cases that you had executed. 
* Export all the API request and Response as POSTMAN collection.
* POSTMAN Collection can be passed as Input as Idaithalam.
* Idaithalam can be integrated along Continuous Integration and Continuous Delivery(CI/CD) with Pipeline.
* Idaithalam take the POSTMAN Collection as Input and Covert as Cucumber Feature file. 
* Cucumblan-API another product will execute the feature file and Produce the Cucumber Report with BDD style.

## Used for Contract testing.
* Support for Contract testing. 

## Used for Production Checkout.
* Utilized to run against selected use case that needs to validated against Production Checkout(Validation during the production release).   

## Used for Agile sprint-end Regression testing.
* During the sprint, You can run all the test cases Manually and then save the response via POSTMAN. Using Idaithalam, Export the POSTMAN Collection and Pass Collection to Idaithalam and will execute and produce the Excellent cucumber HTML Report with all the charts.

----