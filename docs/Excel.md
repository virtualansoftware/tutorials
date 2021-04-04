# Excel as TestPlan Executor 

Can create Excel with all the required Field to execute the API test workflow. 

## What you will get 
1. Excel utilized to feed data to scriptless automation Framework. 
2. Excel spreadsheet used as Run Manager for API Tetsting.
3. **Electronic Data Interchange (EDI)** is the electronic interchange of business information using a standardized format support added available with Low code implementation.

## What it does
Idaithalam read the excel and generate the Virtualan Collection and would be coverted into a Gherkin language(*Feature* file) and then run the feature file and will Produce cucumber based HTML report for the executed testcases. It allow to define Each API flow as separate Sheet in Excel. You can define Multiple sheet and it also allows to executed selected testcases.

## API Configuration
 - **TestCaseName:**
 
    Unique indentifier for the testcase. Name the testcase such a way it can be distinguished. 
 
 - **Type:**
 
    For API testing would be called as "REST".
 
 - **User:**
 
    Indicate the user of the call runs the api call. Reserved for Future purpose.
 
 - **TestCaseNameDesc:**
 
    Add description about the test case. Not a big summary. 4 word description would be suffice. 
 
 - **URL:**
 
    Complete endpoint URL of the API with query parameters 
 
 - **Action:**
 
    HTTP action like GET, POST, PUT, DELETE and etc..
 
 - **ContentType:**
 
    ContentType of the API. will be used for Accept as well, unless overridden in the "RequestHeaders" column 
 
 - **StatusCode:**
 
    What would be expected HTTP status Code to be valdiated.
 
 - **FormParams:**
 
    Used for form based API request and also Multipart support.
 
 - **RequestFile:**
 
    Request file that required for the given request. 
 
 - **RequestHeaders:**
 
    Header should be included in the request.
 
 - **CookieVariables:**
 
    Cookie included in the request.
 
 - **SkipScenario:**
 
   build excel formula condition to skip the scenario based on the context data.
      > Example EXACT ("[petName]","Ethan")

 - **MultiRun**
   
   Parameterization is implemented using "MultiRun values"
   > petId|petName;1000|Ethan;1000|John
   
   ```gherkin
   This translated into this value
   Examples:
      | petId | petName |
      | 1000  | Ethan   |
      | 1000  | John    |
   ```


 - **ResponseFile:**
 
    Actual response valdiated agaist the expected response.
 
 - **ResponseProcessingType:**
 
    The process to redefine the unstandard responses as JSON and compared with Actula response. Little coding needed for unstandard response. Like EDI response. EDI is not a standard reponse but can be compared like JSON to valdiate the data with Actual response. Example value: VirtualanStdType=EDI-271  [EDI270And271Parser](https://raw.githubusercontent.com/virtualansoftware/idaithalam/master/samples/idaithalam-excel-apitesting/src/test/java/io/virtualan/cucumblan/standard/EDI270And271Parser.java)   
 
 - **ResponseByFields:**
 
    Validate specific fields in the repsonse using key value pairs. Key is your JsonPath and values is Expected value.
    > id=[petId];name=[petName];<json-path>=<value>
 

 - **IncludesByPath:**
  
    In the "ResponseFile" response given JsonPath for Json (or) XPath for Xml responses.
  
  - **Csvson:**
  
    Compare the API response with given CSV. CSV would be converted as JSON and compared with the Actula Response.  
  
  - **ExcludeFields:**
    
    If complete "ResponseFile" response to be validated and would like to skip any elements in the API Response without comparing then add that element and would take care skipping the elements without comparing the values. 
 
 - **StoreResponseVariables:**
 
    Can create variable with values from the response using JsonPath, Http request header or Cookie in the request and The stored variable and the value utlized for further api execution steps. 
 
 - **AddifyVariables:**
 
    Can create new variables with values for and store the value utlized for further api execution steps. 
 
 - **Security:**
 
    API login authentication steps for "basicAuth" or okta=htttp://xxx.okat.com 
 
 - **Tags:**
    
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