# Excel as TestPlan Executor 

Can create Excel with all the required Field to execute the API test workflow. 

## What you will get 
1. Excel utilized to feed data to scriptless automation Framework. 
2. Excel spreadsheet used as Run Manager for API Tetsting.
3. **Electronic Data Interchange (EDI)** is the electronic interchange of business information using a standardized format support added available with Low code implementation.

## What it does
Idaithalam read the excel and generate the Virtualan Collection and would be coverted into a Gherkin language(*Feature* file) and then run the feature file and will Produce cucumber based HTML report for the executed testcases. It allow to define Each API flow as separate Sheet in Excel. You can define Multiple sheet and it also allows to executed selected testcases.

## API Configuration
 - **TestCaseName:**  [Example download](https://github.com/virtualansoftware/idaithalam/blob/master/samples/idaithalam-excel-apitesting/src/test/resources/virtualan_collection_testcase_01.xlsx)
 
    Unique indentifier for the testcase. Name the testcase such a way it can be distinguished. 
 
 - **Type:**  [Example download](file:///D:/Elan/virtualan-software-ws/idaithalam/apr-27/idaithalam/samples/idaithalam-db-kafka-apitesting/src/test/resources/virtualan_collection_kafka_db_testcase_0.xlsx)
 
    For API testing would be called as "REST".
 
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
 
    Add description about the test case. Not a big summary. 4 word description would be suffice. 
 
 - **URL:**  [Example download](https://github.com/virtualansoftware/idaithalam/blob/master/samples/idaithalam-excel-apitesting/src/test/resources/virtualan_collection_testcase_01.xlsx)
 
    Complete endpoint URL of the API with query parameters 
 
 - **Action:**  [Example download](file:///D:/Elan/virtualan-software-ws/idaithalam/apr-27/idaithalam/samples/idaithalam-db-kafka-apitesting/src/test/resources/virtualan_collection_kafka_db_testcase_0.xlsx)
 
    HTTP action like GET, POST, PUT, DELETE and DB action DDL, INSERT/UPDATE/DELETE, VERIFY  
 
 - **ContentType:**  [Example download](https://github.com/virtualansoftware/idaithalam/blob/master/samples/idaithalam-excel-apitesting/src/test/resources/virtualan_collection_testcase_01.xlsx)
 
    ContentType of the API. will be used for Accept as well, unless overridden in the "RequestHeaders" column 
 
 - **StatusCode:**  [Example download](https://github.com/virtualansoftware/idaithalam/blob/master/samples/idaithalam-excel-apitesting/src/test/resources/virtualan_collection_testcase_01.xlsx)
 
    What would be expected HTTP status Code to be valdiated.
 
 - **FormParams:**  [Example download](https://github.com/virtualansoftware/idaithalam/blob/master/samples/idaithalam-excel-apitesting/src/test/resources/virtualan_collection_testcase_6.xlsx)
 
    Used for form based API request and also Multipart support.

 - **RequestContent:**  [Example download](https://github.com/virtualansoftware/idaithalam/blob/master/samples/idaithalam-excel-apitesting/src/test/resources/virtualan_collection_testcase_02.xlsx)
   > Takes precedence

    Actual request can be included in this column.
 
 - **RequestFile:**   [Example download](https://github.com/virtualansoftware/idaithalam/blob/master/samples/idaithalam-excel-apitesting/src/test/resources/virtualan_collection_testcase_01.xlsx)
 
    Request file that required for the given request. 
 
 - **RequestHeaders:**
 
    Header should be included in the request.
 
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
 
    Actual response valdiated agaist the expected response.
 
 - **ResponseProcessingType:**  [Example download](https://github.com/virtualansoftware/idaithalam/blob/master/samples/idaithalam-excel-apitesting/src/test/resources/virtualan_collection_testcase_2.xlsx)
 
    The process to redefine the unstandard responses as JSON and compared with Actula response. Little coding needed for unstandard response. Like EDI response. EDI is not a standard reponse but can be compared like JSON to valdiate the data with Actual response. Example value: VirtualanStdType=EDI-271  [EDI270And271Parser](https://raw.githubusercontent.com/virtualansoftware/idaithalam/master/samples/idaithalam-excel-apitesting/src/test/java/io/virtualan/cucumblan/standard/EDI270And271Parser.java)   
 
 - **ResponseByFields:**  [Example download](https://github.com/virtualansoftware/idaithalam/blob/master/samples/idaithalam-excel-apitesting/src/test/resources/virtualan_collection_testcase_01.xlsx)
 
    Validate specific fields in the repsonse using key value pairs. Key is your JsonPath and values is Expected value.
    > id=[petId];name=[petName]; \<json-path>=\<value>

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
  
    Compare the API response with given CSV. CSV would be converted as JSON and compared with the Actula Response.  
  
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
    
    If complete "ResponseFile" response to be validated and would like to skip any elements in the API Response without comparing then add that element and would take care skipping the elements without comparing the values. 
 
 - **StoreResponseVariables:**  [Example download](https://github.com/virtualansoftware/idaithalam/blob/master/samples/idaithalam-excel-apitesting/src/test/resources/virtualan_collection_testcase_2.xlsx)
 
    Can create variable with values from the response using JsonPath, Http request header or Cookie in the request and The stored variable and the value utlized for further api execution steps. 
   > And Store the **category.name** value of the key as **category_name**
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
 
    Can create new variables with values for and store the value utlized for further api execution steps. 
 
    >  And Add the [petId] value of the key as Id # variable based  \
    > And Add the doggie value of the key as petName # direct value

 - **EvaluateFunctionVariables:**  [Example download](https://github.com/virtualansoftware/idaithalam/blob/master/samples/idaithalam-excel-apitesting/src/test/resources/virtualan_bdd_testcase_run_manager.xlsx)
 
   Evaluate the variable created for during execution. 
 
    
 - **Security:**  [Example download](https://github.com/virtualansoftware/idaithalam/blob/master/samples/idaithalam-excel-apitesting/src/test/resources/virtualan_collection_testcase_8.xlsx)
 
    API login authentication steps for "basicAuth" or okta=htttp://xxx.okat.com 
   
   > A. BASIC AUTH:
      1. setup  Example: https://github.com/virtualansoftware/idaithalam/blob/master/samples/idaithalam-excel-apitesting/src/test/resources/virtualan_collection_testcase_8.xlsx 
      
      a. Security=basicAuth  in the Security column in the api
        
      2. https://github.com/virtualansoftware/idaithalam/blob/master/samples/idaithalam-excel-apitesting/src/test/resources/cucumblan-env.properties
      
      a. basic_auth_user_id.api=admin \
      b. basic_auth_password.api=testing2 \
      c. *api denotes as resources of the api 
   
   
    > B.  OKTA has the API Interface
        
      1) Access the OKAT API using the API Way and use "basicAuth" to login to the api. 
      2) Store the access token with JSON path using "StoreResponseVariables" 
         a. add it in the spreadsheet column "pet_accessToken=access_token".
         b. And Store the **access_token** value of the key as **pet_accessToken**   
      3) Build the Header using  in RequestHeaders 
         a. add it as "Authorization=Bearer [pet_accessToken]"  in the spreadsheet column.
         b. And add request with given header params
             | Authorization  | Bearer [pet_accessToken]  |
 - **Tags:**  [Example download](https://github.com/virtualansoftware/idaithalam/blob/master/samples/idaithalam-excel-apitesting/src/test/resources/virtualan_collection_testcase_7.xlsx)
    
    Cucumber tags and can be used to categorize the apis.


## Create the Excel in the following format

|TestCaseName|TestCaseNameDesc|URL|ContentType|RequestFile|RequestHeaders|ResponseFile|ResponseProcessingType|Action|ExcludeFields|StatusCode|
| -----------|:--------------:|-----:| -----:| -----:| -----:| -----:| -----:| -----:| -----:| -----:|
|PetGet|get API testing|https://live.virtualandemo.com/api/pets/findByTags?tags=grey|application/json|||get_response.json||GET||200|
|PetPost|pet post api test|http://live.virtualandemo.com/api/pets|application/xml|input.xml||output.xml|VirtualanStdType=EDI-271|POST|Date|200|


## Example excel is attached.
[Example Excel attached](https://github.com/virtualansoftware/idaithalam/blob/master/samples/idaithalam-excel-apitesting/src/test/resources/virtualan_collection_testcase_0.xlsx)


## Example Project.
   [idaithalam-excel-apitesting](https://github.com/virtualansoftware/idaithalam/tree/master/samples/idaithalam-excel-apitesting)

## Example Generated file and reports:
   1. [cucumber-html-reports](/1/cucumber-html-reports/overview-features.html)
   2. [virtualan-contract.0.feature](/1/feature/virtualan-contract.0.feature)
   3. [cucumblan.properties](/1/cucumblan.properties)

----