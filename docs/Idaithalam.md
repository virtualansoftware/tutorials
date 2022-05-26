# Idaithalam - Lowcode Test Automation

[![Maven Central](https://img.shields.io/maven-central/v/io.virtualan/idaithalam.svg?label=Maven%20Central)](https://search.maven.org/search?q=g:%22io.virtualan%22%20AND%20a:%22idaithalam%22) 
                          
## What is Idaithalam( "idai" means middleware and "thalam" means platform => Middelware testing platform): 

Idaithalam is a low code Test automation Framework,  developed using Java and Cucumber. It leverages Behavior Driven Development (BDD). Tester can create test cases/scripts in simple Excel with API Spec. Excel is a simplified way to create Json based test scripts in Idaithalam. Test cases can be created quickly and tested in minutes.

As a tester, you need to create Excel and pass it to Idaithalam Framework. 

1. First, generate the Json based test scripts(Virtualan Collection) from Excel. During test execution, this test script collection can be directly utilized.  
2. Then it generates Feature files from the Virtualan Collection and its executed.
3. Lastly, It generates test report in BDD/Cucumber style. 

This provide complete testing support for REST APIs, GraphQL, RDBMS DB and Kafka Event messages

#idaithalam #apitesting #testautomation #restapitesting #insprintautomation #rdbmstesting #graphqltesting #kafkamessagetesting #eventvalidation #messagevalidation #cucumber #bdd

**Virtualan Collection is a JSON based TestScripts generated from Excel**

## QA Talks Community Presentation – Codeless Conference 2022  

- Low code/No Code API Workflow Automation -  [Click here](https://docs.google.com/presentation/d/1qzo_AEwub6qWiyASA0pdKd7YQE8C3IYP/edit?usp=sharing&ouid=112196114616919270195&rtpof=true&sd=true)
  - Youtube link [Click here](https://www.youtube.com/watch?v=R0kO8XI60Bs)

- Low code/No Code KAFKA Workflow Automation - [Click here](https://docs.google.com/presentation/d/1Bt29js4sDeRi-CLGb5jZ1DH9SlQjuXDH/edit?usp=sharing&ouid=112196114616919270195&rtpof=true&sd=true)
  - Youtube link [Click here](https://www.youtube.com/watch?v=RINHaBdam-A)

- Low code/No Code API and DB Workflow Automation - [Click here](https://docs.google.com/presentation/d/1LRJjY3H-rRf-6QX054eFelURY59gnJir/edit?usp=sharing&ouid=112196114616919270195&rtpof=true&sd=true)
  - Youtube link [Click here](https://www.youtube.com/watch?v=3a-awMK02n4)

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
  -  [Rest-kafka](https://github.com/virtualansoftware/microservices-lowcode-testautomation/tree/main/rest-db-kafka)
  -  [DB](https://github.com/virtualansoftware/microservices-lowcode-testautomation/tree/main/db)
  -  [Examples](https://github.com/virtualansoftware/microservices-lowcode-testautomation/tree/main/examples)
  -  [Generate-Feature-File](https://github.com/virtualansoftware/microservices-lowcode-testautomation/tree/main/generate-feature-file)
  -  [Execute-Feature-File](https://github.com/virtualansoftware/microservices-lowcode-testautomation/tree/main/execute-feature-file)
  -  [Workflow-virtualan-collection-Rest](https://github.com/virtualansoftware/microservices-lowcode-testautomation/tree/main/workflow-virtualan-collection-rest)
  -  [Graphql](https://github.com/virtualansoftware/microservices-lowcode-testautomation/tree/main/graphql)
  -  [Microservices-lowcode-testautomation Projects](https://github.com/virtualansoftware/microservices-lowcode-testautomation) 


## Video Tutorials 


- [What is Idaithalam](https://www.youtube.com/watch?v=qsxlRAML5-0)
- [How to setup and perform API Idaithalam](https://www.youtube.com/watch?v=OOYkOat9c3M)
- [How to setup and perform Data integrity testing ](https://www.youtube.com/watch?v=dS3lhIP9D2M&t=233s) 


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
  > In the Resource column, which contains "ep". It represents the service Endpoint in the yml file where service executed.
    
  > Json test scripts and Feature file created in the "outputDir" directory that is "target/rest-get"

  > After execution, cucumber report created in the "outputJsonDir" directory that is "target/idaithalam"

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
    


## Used for API testing, DB Testing and Kafka message Testing.
- Achieve true CI/CD/CT integration and in-sprint API automation​
- Bring down the API testing time from days to minutes​
- Ability to run API tests in multiple environment parallel​y
- Eliminate coding requirement for API testing​
- Quick testing before moving to production & post-production checkout​
- Minimal maintenance and troubleshooting efforts
- Significant time saving on learning curve for new team members (learn framework, understand existing scripts, write new scripts) ​
- Team members without any technical background can also execute the API test through Automation.

----