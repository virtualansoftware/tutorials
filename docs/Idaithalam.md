# Idaithalam - Scriptless Automation Framework

[![Maven Central](https://img.shields.io/maven-central/v/io.virtualan/idaithalam.svg?label=Maven%20Central)](https://search.maven.org/search?q=g:%22io.virtualan%22%20AND%20a:%22idaithalam%22) 
                          
## What is it:

Low code Test automation framework using cucumber and supports Behavior Driven Development (BDD). Can build test cases using Excel and Postman collection. It allows to build and test api workflow in minutes. 

**Idaithalam is a BDD style Cucumber based low code automation product.**

As a user: You need to export the POSTMAN Collection or create Excel and pass to Idaithalam. 

Currently It supports generate Feature files for **POSTMAN Collection** and  **Excel** format. 
This will covert REST APIs based on POST, GET, PUT, DELETE and PATCH action as respective domain specific language which helps you to describe API/business behavior without the need to go into detail of implementation. 

 ## Maven dependency:
  
  ```mvn 
    <dependency>
      <groupId>io.virtualan</groupId>
       <artifactId>idaithalam</artifactId>
       <version>${idaithalam.version}</version>
    </dependency>
  ```  

## How to Integrate: 

1. cucumblan.properties  - Should be added in classpath

    ```
    service.api=https://live.virtualandemo.com              # Service Endpoint URL
    virtualan.data.load=idaithalan.postman_collection.json  # Collection file should be in CLASSPATH. added POSTMAN Collection  
    virtualan.data.type=POSTMAN                             # Collection Type.  POSTMAN, VIRTUALAN/EXCEL
    ```
2.  "conf" directory: 

    ``` 
    1. Should be created in the project root folder. 
    2. Feature file will be Auto generated here. 
    3. You can keep cucumblan.properties and Collection files in this location.

    Example: 
    https://github.com/virtualansoftware/idaithalam-contract-testing-demo/tree/master/conf 
    ```
3. IdaithalamExecutor.validateContract(args1, args2);

    ```
    args 1: Test Plan Name  
    args 2: Auto generated location of testplan, test cases, feature file and testcase results/reports 
    ```

4. Code to Invoke Automation testcase Execution for POSTMAN Collection:
> Example Project: [idaithalam-postman-apitesting](https://github.com/virtualansoftware/idaithalam/tree/master/samples/idaithalam-postmancoll-apitesting)
```
//Initiate the contract testing
//Generate feature file from POSTMAN Collection
//Execute and Generate the HTML Cucumber report
int status = IdaithalamExecutor.validateContract("Pet API Testing");
if(status != 0) {
    Assert.assertTrue(false); //to make CI CD pipeline fail during the Execution
 }
 Assert.assertTrue(true); //to confirm the successful Execution of testplan
```

5. Code to Invoke Automation testcase Execution for Excel:
> Example Project: [idaithalam-excel-apitesting](https://github.com/virtualansoftware/idaithalam/tree/master/samples/idaithalam-excel-apitesting)
```
//Initiate the contract testing
//Generate feature file from EXCEL/VIRTUALAN Collection
//Execute and Generate the HTML Cucumber report
int testPlanIndex = 1;
//pass the spreadsheet that you want to pass to the user
ExcelToCollectionGenerator.createCollection(list, "virtualan_collection_testcase_4.xlsx", System.getProperty("user.dir") +"/target/"+testPlanIndex);
//Generate feature and summary page html report for the selected testcase from the excel
int status = IdaithalamExecutor
    .validateContract("API EXCEL based api testing", System.getProperty("user.dir") +"/target/"+testPlanIndex);
 if(status != 0) {
    Assert.assertTrue(false); //to make CI CD pipeline fail during the Execution
 }
 Assert.assertTrue(true); //to confirm the successful Execution of testplan
```

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
 Copyright 2021 Virtualan Software Contributors (https://virtualan.io)