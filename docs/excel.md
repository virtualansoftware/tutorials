# Excel as RunManager for Lowcode automation 

Can create Excel with all the required Field to execute the API test workflow. 

## What you will get 
1. Excel used as scriptless automation Framework. 
2. Excel spreadsheet used as Run manager with No Coding needed for API Tetsting.
3. Electronic Data Interchange (EDI) is the electronic interchange of business information using a standardized format support added available with Low code implementation.

## What it does
Idaithalam read the excel and generate the Virtualan Collection and would be coverted into a *Feature* file and then runs the feature file and APIs are configured in the Excel and will Produce cucumber based HTML report for the executed testcases.

## Column used for API Configuration
    - TestCaseName
        Unique indentifier for the testcase. Name the testcase such a way.it can be distingused. 
	- Type
        For API testing would be called as "REST".
    - User
        Indicate the user of the call runs the api call. Reserved for Future purpose.
    - TestCaseNameDesc
        Add details about the test case. Not a big summay. 4 word description. 
    - URL
        Complete endpoint URL of the API with query parameters 
    - ContentType
        ContentType of the API. will be used for Accept as well, unless overridden in the "RequestHeaders" column 
    - FormParams
        Used for form based API request and also Multipart support.
    - RequestFile
        Request file that required for the given request. 
    - RequestHeaders
        Header should be included in the request.
    - CookieVariables
        Cookie included in the request.
    - ResponseFile
        Actual response valdiated agaist the expected response.
    - ResponseProcessingType
        The process to redefine the unstandard responses as JSON and compared with Actula response. Little coding needed for unstandard response. Like EDI response. EDI is not a standard reponse but can be compared like JSON to valdiate the data with Actual response. Example value: VirtualanStdType=EDI-271  [EDI270And271Parser](https://raw.githubusercontent.com/virtualansoftware/idaithalam/master/samples/idaithalam-excel-apitesting/src/test/java/io/virtualan/cucumblan/standard/EDI270And271Parser.java)   
    - ResponseByFields
        Validate specific fields in the repsonse using key value pairs. Key is your JsonPath and values is Expected value.
    - Action
        HTTP action like GET, POST, PUT, DELETE and etc..
    - ExcludeFields
        If complete "ResponseFile" response to be validated and would like to skip any elements in the API Response without comparing then add that element and would take care skipping the elements without comparing the values. 
    - StatusCode
        What would be expected HTTP status Code to be valdiated.
    - StoreResponseVariables
        Can create variable with values from the response using JsonPath and store the value utlized for further api execution steps. 
    - AddifyVariables
        Can create new variables with values for and store the value utlized for further api execution steps. 
    - Security
        API login authentication steps for "basicAuth" or okta=htttp://xxx.okat.com 
    - Tags
        Cucumber tags and can be used to categorize the apis. 
    - IncludesByPath
        In the "ResponseFile" response given JsonPath for Json (or) XPath for Xml responses.