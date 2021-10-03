<h1 align="center"> Frequently asked questions(FAQ) for Idaithalam:</h1>

1. **<span style="color:#800040"> What is VIRTUALAN COLLECTION?</span>**

    <span style="color:#004080 ">
        Virtualan Collection is json representation of Idaithalam test script. 
    </span>
2. **<span style="color:#800040">Why do we need to use Excel? Excel is a heavy object model? Excel is considered a legacy way of using.. clarify? </span>**

    <span style="color:#004080 ">
    Excellent question :smile:

    a. Any type of user can develop test scripts. 
       - Non technical user
       - Manual testers
       - Subject matter Experts
       - Test engineers    
    b. Excel can be used only for creating test scripts during test script development.     
    
    c. As we dont have UI, So we are providing users to use Excel to create **Virtualan Collection**( a.k.a. Test Scripts).
    
    d. You can execute **Virtualan Collection** directly in CI/CD PIPELINE in the PROD mode.
    </span>

3. **<span style="color:#800040">Feature file utilization – Is the feature file will be created every time with each execution? </span>**

    <span style="color:#004080 ">
        Yes. Feature file created every time before each execution.
    </span>   

4. **<span style="color:#800040">How to make Orchestration of APIs ? (or)     Management of Excel(Need of multiple sheets?) and maintenance efforts with more than 200 test cases?
    </span>**<span style="color:#004080 ">
    - Executing each API and validating it's response can be added in the single row in the excel sheet, which will be generated as gherkin Scenario. 

    - All apis(Gherkin scenarios/All excel rows) in a single sheet would be generated as Gherkin Feature. This sheet(gherkin Feature) would perform an API Workflow Execution.

    - Each sheet in the excel creates a separate Gherkin feature(Feature file).

    - Each Excel sheet transformed as **Virtualan Collection**(JSON Array) before it generated as Gherkin Feature. and Each JSON Object referred to as row in the excel which is Gherkin Scenario.
    
    ![](_images/idaithalam/Demo-work-flow.png ':size=65%')

    - Execute VIRTUALAN COLLECTION During test case execution via CI/CD pipeline.
        - Example: Accept quote User case 1: [Sheet: 1] 
            > 1. [Accept quote User case - Excel - Download](https://github.com/virtualansoftware/microservices-lowcode-testautomation/blob/a7ac3d50c7a820392a569f093aa8302969c50605/src/test/resources/css/customer-self-service.xlsx)
            > 2. [Accept quote User case - Virtualan Collection - Download](https://github.com/virtualansoftware/microservices-lowcode-testautomation/blob/a7ac3d50c7a820392a569f093aa8302969c50605/virtualan-collection/Customer-Self-Service-Accept.json)   
            
            - Excel Row 1: Login to Customer care api
                    - Login to Insurance customer care API.
                    - Pass username and password from Secret store.
                    - Store api authentication token response as token.
            - Excel Row 2: Get CustomerId.
                    - Get the userid from the GET API.
                    - Pass the previous token in the http headers.
                    - Store customerId in the variable. 
            - Excel Row 3: get all the user information using customerId.
                    - Get Customer information from the GET API.
                    - Pass the previous token in the http headers.
                    - Store Customer Information in the variable. 
            - Excel Row 4: Create insurance quote.
                    - Pass the previous token in the http headers.
                    - Pass all the Customer Information for insurance quote creation. 
                    - Create Insurance Quote using Quote API.
                    - Store Quote id in variable.
            - Excel Row 5: Update Quote Received
                    - Pass the previous token in the http headers
                    - Pass the previous quoteId in the Quote Received Update API
                    - Update Quote Received.
            - Excel Row 6: Update Quote Accepted.  
                    - Pass the previous token in the http headers.
                    - Pass the previous quoteId in the Quote Accept Update API.
                    - Update Quote Accepted.
        -  Example: Reject quote User case 2: [Sheet: 2]
            > 1. [Reject quote User case - Excel - Download](https://github.com/virtualansoftware/microservices-lowcode-testautomation/blob/a7ac3d50c7a820392a569f093aa8302969c50605/src/test/resources/css/customer-self-service.xlsx)
            > 2. [Reject quote User case - Virtualan Collection - Download](https://github.com/virtualansoftware/microservices-lowcode-testautomation/blob/a7ac3d50c7a820392a569f093aa8302969c50605/virtualan-collection/Customer-Self-Service-Reject.json)   
            - Excel Row 1: Login to Customer care api
                    - Login to Insurance customer care API.
                    - Pass username and password from Secret store.
                    - Store api authentication token response as token.
            - Excel Row 2: Get CustomerId.
                    - Get the userid from the GET API.
                    - Pass the previous token in the http headers.
                    - Store customerId in the variable. 
            - Excel Row 3: get all the user information using customerId.
                    - Get Customer information from the GET API.
                    - Pass the previous token in the http headers.
                    - Store Customer Information in the variable. 
            - Excel Row 4: Create insurance quote.
                    - Pass the previous token in the http headers.
                    - Pass all the Customer Information for insurance quote creation. 
                    - Create Insurance Quote using Quote API.
                    - Store Quote id in variable.
            - Excel Row 5: Update Quote Received
                    - Pass the previous token in the http headers
                    - Pass the previous quoteId in the Quote Received Update API
                    - Update Quote Received.
            - Excel Row 6: Update Quote Rejected.  
                    - Pass the previous token in the http headers.
                    - Pass the previous quoteId in the Quote Reject Update API.
                    - Update Quote Rejected.
</span>

6. **<span style="color:#800040"> Negative Test validations?</span>**
    <span style="color:#004080 ">
        Yes. It allows users to execute negative test case validation as well.
    </span>

7. **<span style="color:#800040"> Validation on multiple fields?</span>**
    <span style="color:#004080 ">
        Yes. It allows users to validate api responses using JSON Object and JSON Path.
    </span>

8. **<span style="color:#800040"> How to handle Okta integration ?</span>**

    <span style="color:#004080 ">Yes. It allows users to build [any api model] OKTA Integration using API. **[OKTA also expressed as api model]** </span>

9. **<span style="color:#800040"> Any reports can be generated?</span>**
    <span style="color:#004080 ">
        Can generate/integrate any kind of industry standard Cucumber report.
    </span>

10. **<span style="color:#800040">
    When API Contracts change, then how will it be updated in Excel?</span>**
    <span style="color:#004080 ">
        Yes, Need to change the Excel based on new changes if required and Need to regenerate the VIRTUALAN Collection which helps track the changes in git repo.
    </span>

11. **<span style="color:#800040">  How can I manage Excel/Virtualan Collection/Test Scripts? How can I track changes?</span>**
    <span style="color:#004080 ">
        Yes. Can store generated VIRTUALAN Collection in the GIT repository. This will help track changes in the excel as well how many test cases are added or deleted(DELTA Change in the Excel). 
    </span>

12. **<span style="color:#800040"> How to handle Multi field validation?</span>**
    <span style="color:#004080 ">
	    Using comma separated JSON(CSVSON), JSON PATH, EXCEL FUNCTION and JSON Object. 
    </span>

13. **<span style="color:#800040"> How to handle some complex assertion?</span>**
    <span style="color:#004080 ">
    Using EXCEL FUNCTION.
    </span>


------