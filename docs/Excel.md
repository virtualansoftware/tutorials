# Excel as TestPlan Executor 

Can create Excel with all the required fields to execute the API test workflow. 

## What you will get 
1. Excel utilized to feed data to scriptless automation Framework. 
2. Excel spreadsheet used as Run Manager for API Testing.
3. **Electronic Data Interchange (EDI)** is the electronic interchange of business information using a standardized format support added available with Low code implementation.





## What it does
Idaithalam reads the excel and generates the Virtualan Collection and would be converted into a Gherkin language(*Feature* file) and then run the feature file and will Produce cucumber based HTML report for the executed test cases. It allows defining Each API flow as a separate Sheet in Excel. You can define Multiple sheets and it also allows you to executed selected test cases.

## API Configuration
 - **TestCaseName:**  [Example download](https://github.com/virtualansoftware/idaithalam/blob/master/samples/idaithalam-excel-apitesting/src/test/resources/virtualan_collection_testcase_01.xlsx)
 
    Unique identifier for the test case. Name the test case such a way it can be distinguished. 
 
 - **Type:**  [Example download](file:///D:/Elan/virtualan-software-ws/idaithalam/apr-27/idaithalam/samples/idaithalam-db-kafka-apitesting/src/test/resources/virtualan_collection_kafka_db_testcase_0.xlsx)
 
    API testing would be called as "REST".
 
- **Resource:**  [Example download](file:///D:/Elan/virtualan-software-ws/idaithalam/apr-27/idaithalam/samples/idaithalam-db-kafka-apitesting/src/test/resources/virtualan_collection_kafka_db_testcase_0.xlsx)
 
    Indicate the user accessing the api or db or kakfa for the selected context. 

- **StepInfo:**  [Example download](file:///D:/Elan/virtualan-software-ws/idaithalam/apr-27/idaithalam/samples/idaithalam-db-kafka-apitesting/src/test/resources/virtualan_collection_kafka_db_testcase_0.xlsx)
     
     add discription for the selected step to discribe the functionality. 

 - **MessageType:**  [Example download](file:///D:/Elan/virtualan-software-ws/idaithalam/apr-27/idaithalam/samples/idaithalam-db-kafka-apitesting/src/test/resources/virtualan_collection_kafka_db_testcase_0.xlsx)
      
      for the kafka testing.

 - **Event:**  [Example download](file:///D:/Elan/virtualan-software-ws/idaithalam/apr-27/idaithalam/samples/idaithalam-db-kafka-apitesting/src/test/resources/virtualan_collection_kafka_db_testcase_0.xlsx)
      
      for the kafka testing.

 - **Identifier:**  [Example download](file:///D:/Elan/virtualan-software-ws/idaithalam/apr-27/idaithalam/samples/idaithalam-db-kafka-apitesting/src/test/resources/virtualan_collection_kafka_db_testcase_0.xlsx)
      
      for the kafka testing.

 - **User:**
 
    Indicate the user of the call runs the api call. Reserved for Future purpose.
 
 - **TestCaseNameDesc:**  [Example download](https://github.com/virtualansoftware/idaithalam/blob/master/samples/idaithalam-excel-apitesting/src/test/resources/virtualan_collection_testcase_01.xlsx)
 
    Add description about the test case. Not a big summary. a 4 word description would suffice. 
 
 - **URL:**  [Example download](https://github.com/virtualansoftware/idaithalam/blob/master/samples/idaithalam-excel-apitesting/src/test/resources/virtualan_collection_testcase_01.xlsx)
 
    Complete endpoint URL of the API with query parameters 
 
 - **Action:**  [Example download](file:///D:/Elan/virtualan-software-ws/idaithalam/apr-27/idaithalam/samples/idaithalam-db-kafka-apitesting/src/test/resources/virtualan_collection_kafka_db_testcase_0.xlsx)
 
    HTTP action like GET, POST, PUT, DELETE and DB action DDL, INSERT/UPDATE/DELETE, VERIFY  
 
 - **ContentType:**  [Example download](https://github.com/virtualansoftware/idaithalam/blob/master/samples/idaithalam-excel-apitesting/src/test/resources/virtualan_collection_testcase_01.xlsx)
 
    ContentType of the API. will be used for Accept as well, unless overridden in the "RequestHeaders" column 
 
 - **StatusCode:**  [Example download](https://github.com/virtualansoftware/idaithalam/blob/master/samples/idaithalam-excel-apitesting/src/test/resources/virtualan_collection_testcase_01.xlsx)
 
    What would be expected of the HTTP status Code to be validated.
 
 - **FormParams:**  [Example download](https://github.com/virtualansoftware/idaithalam/blob/master/samples/idaithalam-excel-apitesting/src/test/resources/virtualan_collection_testcase_6.xlsx)
 
    Used for form based API requests and also Multipart support.

 - **RequestContent:**  [Example download](https://github.com/virtualansoftware/idaithalam/blob/master/samples/idaithalam-excel-apitesting/src/test/resources/virtualan_collection_testcase_02.xlsx)
   > Takes precedence

    Actual requests can be included in this column.
 
 - **RequestFile:**   [Example download](https://github.com/virtualansoftware/idaithalam/blob/master/samples/idaithalam-excel-apitesting/src/test/resources/virtualan_collection_testcase_01.xlsx)
 
    Request file that is required for the given request. 
 
 - **RequestHeaders:**
 
    Headers should be included in the request.
 
 - **CookieVariables:**
 
    Cookie included in the request.
 
 - **SkipScenario:**  [Example download](https://github.com/virtualansoftware/idaithalam/blob/master/samples/idaithalam-excel-apitesting/src/test/resources/virtualan_collection_testcase_01.xlsx)
 
   build excel formula condition to skip the scenario based on the context data.
      > Example EXACT ("[petName]","Ethan")

 - **MultiRun**  [Example download](https://github.com/virtualansoftware/idaithalam/blob/master/samples/idaithalam-excel-apitesting/src/test/resources/virtualan_collection_testcase_01.xlsx)
   
   Parameterization is implemented using "MultiRun values"
   > petId|petName;1000|Ethan;1000|John
   
   ```gherkin
   This translated into this value
   Examples:
      | petId | petName |
      | 1000  | Ethan   |
      | 1000  | John    |
   ```

 - **ResponseContent:** [Example download](https://github.com/virtualansoftware/idaithalam/blob/master/samples/idaithalam-excel-apitesting/src/test/resources/virtualan_collection_testcase_02.xlsx)
   > Takes precedence

    Actual response can be included in this column.

 - **ResponseFile:**  [Example download](https://github.com/virtualansoftware/idaithalam/blob/master/samples/idaithalam-excel-apitesting/src/test/resources/virtualan_collection_testcase_0.xlsx)
 
    Actual response validated against the expected response.
 
 - **ResponseProcessingType:**  [Example download](https://github.com/virtualansoftware/idaithalam/blob/master/samples/idaithalam-excel-apitesting/src/test/resources/virtualan_collection_testcase_2.xlsx)
 
    The process to redefine the unstandard responses as JSON and compared with Actual response. Little coding needed for non standard response. Like EDI response. EDI is not a standard response but can be compared like JSON to validate the data with Actual response. Example value: VirtualanStdType=EDI-271  [EDI270And271Parser](https://raw.githubusercontent.com/virtualansoftware/idaithalam/master/samples/idaithalam-excel-apitesting/src/test/java/io/virtualan/cucumblan/standard/EDI270And271Parser.java)   
 
 - **ResponseByFields:**  [Example download](https://github.com/virtualansoftware/idaithalam/blob/master/samples/idaithalam-excel-apitesting/src/test/resources/virtualan_collection_testcase_01.xlsx)
 
    Validate specific fields in the response using key value pairs. Key is your JsonPath and values is Expected value.
    > id=[petId];name=[petName]; \<json-path>=\<value>

   > Find JSON Array handling in response by field validation.  
         1. Read Customer infos - Find last element
            customers[-1].customerId=[customerId]  #parametirzed way of validating the dynamic customerId
         2. customers.find { it.firstname == 'Ado' }.postalCode=6500 # Search element by Name "Ado" in the JSON Array and validate the Postal Code
            customers.find { it.customerId == 'bunlo9vk5f' }.firstname=Ado  # Search element by Name "bunlo9vk5f" in the JSON Array and validate the first name
            customers.find { it.customerId == 'f2m0v9b73c' }.email=blangman14@example.com # Search element by Name "f2m0v9b73c" in the JSON Array and validate the first name   

   ```gerhkin
       Scenario: Read petId and Not Found - GET api call
      Given a user perform a api action
      And add request with given header params
        | contentType | application/json |
      When a user get application/json in /api/pets/1000 resource on api
      Then Verify the status code is 500
      And Verify across response includes following in the response
        | code | MOCK_DATA_NOT_SET |

   ```   

 - **IncludesByPath:**  [Example download](https://github.com/virtualansoftware/idaithalam/blob/master/samples/idaithalam-excel-apitesting/src/test/resources/virtualan_collection_testcase_7.xlsx)
  
    In the "ResponseFile" response given JsonPath for Json (or) XPath for Xml responses.

   ```gerhkin
       Scenario: Create Pet for Given Input - POST api call
      Given a user perform a api action
      And add request with given header params
        | contentType | application/json |
      And Create api with given input
        | photoUrls[0]  | string    |
        | name          | doggie-1  |
        | id            | i~100     |
        | category.name | string    |
        | category.id   | i~100     |
        | status        | available |
        | tags[0].name  | string    |
        | tags[0].id    | i~0       |
      When a user post application/json in /api/pets resource on api
      Then Verify the status code is 201
      And Verify api response application/json include byPath Create-Pet-for-Given-Input_response.txt includes in the response
        | id            |
        | name          |
        | category.id   |
        | category.name |

   ```
  - **Csvson:**  [Example download](https://github.com/virtualansoftware/idaithalam/blob/master/samples/idaithalam-excel-apitesting/src/test/resources/virtualan_collection_testcase_01.xlsx)
  
    Compare the API response with given CSV. CSV would be converted as JSON and compared with the Actual Response.  
  
   Example:
         |ppu,name,toppings,id,type | 
         |d~0.55,Cake,i~5001\|i~2001\|,0001,donut |
   
   ```gerhkin
    Scenario: Read petId by Tag - GET api call
      Given a user perform a api action
      And add request with given query params
        | tags | spring-grey |
      And add request with given header params
        | contentType | application/json |
      When a user get application/json in /api/pets/findByTags resource on api
      Then Verify the status code is 200
      And Verify api response csvson includes in the response
        | id,name,category/id:name,photoUrls,status,tags/id:name           |
        | i~201,Butch,i~200:Bulldog,string\|,available,i~201:spring-grey\| |
   ```
  
  - **ExcludeFields:**  [Example download](https://github.com/virtualansoftware/idaithalam/blob/master/samples/idaithalam-excel-apitesting/src/test/resources/virtualan_collection_testcase_2.xlsx)
    
    If a complete "ResponseFile" response is to be validated and would like to skip any elements in the API Response without comparing then add that element and would take care skipping the elements without comparing the values. 
 
 - **StoreResponseVariables:**  [Example download](https://github.com/virtualansoftware/idaithalam/blob/master/samples/idaithalam-excel-apitesting/src/test/resources/virtualan_collection_testcase_2.xlsx)
 
    Can create variables with values from the response using JsonPath, Http request header or Cookie in the request and The stored variable and the value utilized for further api execution steps. 
   > And Store the **category.name** value of the key as **category_name**

   > Find JSON Array handling in response by field validation.  
         1. Read Customer id form  last element of JSONArray and sore the CustomerId
            id=customers[-1].customerId
         2. Read any element from JSONArray
            postalCode=customers.find { it.firstname == 'Ado' }.postalCode # Search element by Name "Ado" in the JSON Array and store the Postal Code
            firstname=customers.find { it.customerId == 'bunlo9vk5f' }.firstname  # Search element by Name "bunlo9vk5f" in the JSON Array and store the firstname
            userEmail=customers.find { it.customerId == 'f2m0v9b73c' }.email # Search element by Name "f2m0v9b73c" in the JSON Array and store the firstname   


   ```JSON
      {
      "category": {
         "id": 100,
         "name": "string"
      },
      "id": 100,
      "name": "doggie",
      "photoUrls": [
         "string"
      ],
      "status": "available",
      "tags": [
         {
            "id": 0,
            "name": "string"
         }
      ]
      }
   ```

 - **AddifyVariables:**  [Example download](https://github.com/virtualansoftware/idaithalam/blob/master/samples/idaithalam-excel-apitesting/src/test/resources/virtualan_collection_testcase_01.xlsx)
 
    Can create new variables with values for and store the value utilized for further api execution steps. 
 
    >  And Add the [petId] value of the key as Id # variable based  \
    > And Add the doggie value of the key as petName # direct value

 - **EvaluateFunctionVariables:**  [Example download](https://github.com/virtualansoftware/idaithalam/blob/master/samples/idaithalam-excel-apitesting/src/test/resources/virtualan_bdd_testcase_run_manager.xlsx)
 
   Evaluate the variable created during workflow execution. This will help generate the dynamic variable and values. This executes the command using pure EXCEL functions. I have added a couple of Date functionality to define values dynamically. This will create variables with evaluated function. Any excel functions can be evaluated **during runtime(which script execution)** with BDD script. 
   
   > Of Course this will support/evaluate dynamic variables and value needs in IDAITHALAM 

      Example:
   
         1. startDate=TEXT(TODAY(),"yyyy-mm-dd")  #today date  - String type
         
         2. expiryDate=SUBSTITUTE(TEXT(NOW()+365, "yyyy-mm-dd HH:\mm:ss"), " ", "T") #future date with yyyy-mm-ddTHH:\mm:ss format
         
         3. success=c~LEN("[firstname]")=3  # will verify if the first name only 3 character then will succeed
         
         4. fail=c~LEN("[firstname]")=3  # will verify if the first name only 3 character then will fail
         
         5. length=i~LEN("[firstname]")  # will create Integer variable with value
         
         6. isMatch=b~LEN("[firstname]")=3  # will create boolean variable with value
         

    
 - **Security:**  [Example download](https://github.com/virtualansoftware/idaithalam/blob/master/samples/idaithalam-excel-apitesting/src/test/resources/virtualan_collection_testcase_8.xlsx)
 
    API login authentication steps for "basicAuth" 
   
   > A. BASIC AUTH:
      1. setup  Example: https://github.com/virtualansoftware/idaithalam/blob/master/samples/idaithalam-excel-apitesting/src/test/resources/virtualan_collection_testcase_8.xlsx 
      
      a. Security=basicAuth  in the Security column in the api
        
      2. https://github.com/virtualansoftware/idaithalam/blob/master/samples/idaithalam-excel-apitesting/src/test/resources/cucumblan-env.properties
      
      a. basic_auth_user_id.api=admin \
      b. basic_auth_password.api=testing2 \
      c. *api denotes as resources of the api 
   
      **if you create variables suffix with .password and will not printed values in the logs**
   
    > B.  OKTA has the API Interface
        
      1) Access the OKAT API using the API Way and use "basicAuth" to login to the api. 

         Create excel with given format to get OKTA access token 
         
|TestCaseName|Type| Resource|TestCaseNameDesc|URL|ContentType|Action|StatusCode|RequestHeaders|FormParams|StoreResponseVariables|Security|
| -----------|:--------------:|:--------------:|:--------------:|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|:-------:|:------:|
| OKAT_TOKEN_ACCESS | REST | oktaapi | Get OKTA Token |https://localhost/oauth2/default/v1/token|application/x-www-form-urlencoded|POST|200|Accept=application/json|grant_type=client_credentials;scope=Virtualan|pet_accessToken=access_token| basicAuth |
 | PetGet | REST | ep | get API testing|https://localhost/pets/findByTags?tags=red|application/json|GET|200| Authorization=Bearer [pet_accessToken]|| ||

      2) Store the access token with a JSON path using "StoreResponseVariables" 
         a. add it in the spreadsheet column "pet_accessToken=access_token".
         b. And Store the **access_token** value of the key as **pet_accessToken**   
      3) Build the Header using  in RequestHeaders 
         a. add it as "Authorization=Bearer [pet_accessToken]"  in the spreadsheet column.
         b. And add request with given header params
             | Authorization  | Bearer [pet_accessToken]  |
 - **Tags:**  [Example download](https://github.com/virtualansoftware/idaithalam/blob/master/samples/idaithalam-excel-apitesting/src/test/resources/virtualan_collection_testcase_7.xlsx)
    
    Cucumber tags and can be used to categorize the apis.




## Example excel is attached.
[Example Excel attached](https://github.com/virtualansoftware/idaithalam/blob/master/samples/idaithalam-excel-apitesting/src/test/resources/virtualan_collection_testcase_0.xlsx)


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


## Example Generated file and reports:
   1. [cucumber-html-reports](/api/cucumber-html-reports/overview-features.html)
   2. [virtualan-contract.0.feature](/api/feature/virtualan-contract.0.feature)
   3. [cucumblan.properties](/api/cucumblan.properties)

----

