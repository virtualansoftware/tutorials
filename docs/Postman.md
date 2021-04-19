# Postman

## Create POSTMAN Collection
* Most of the common use case, You can execute as Regression test suite for the test case executed manually via POSTMAN.
* Run the testcase via POSTMAN and store the response as Example in the POSTMAN.
* Run all the apis via POSTMAN for all the test cases and capture and save the response. 
* Export all the API request and Response as POSTMAN collection.
* POSTMAN Collection can be passed as Input as Idaithalam.

1. Create a collection

2. Under the created collection, create a API request and Save URL for the API testing

![](_images/pmcollection/save%20creation.png ':size=40%')

3. Add the GET URL for the API testing

4. After providing the input information for the API, run the API by clicking 'SEND'

![](_images/pmcollection/runapirequest.png ':size=80%')

5. Once the API response is received, Save the API request via 'save example' in the postman

![](_images/pmcollection/save_example.png ':size=80%')

6. Save the sample

![](_images/pmcollection/save.png ':size=80%')

7. Repeat the above steps to create all the API request

8. Export the created API request/response as Postman collection

![](_images/pmcollection/export.png ':size=30%')


## Demo POSTMAN Collection: 
> Sample postman collection created.

[https://github.com/virtualansoftware/idaithalam-contract-testing-demo/blob/master/src/test/resources/idaithalan.postman_collection.json](https://github.com/virtualansoftware/idaithalam-contract-testing-demo/blob/master/src/test/resources/idaithalan.postman_collection.json) 

## Auto Generated Feature file: 
> Auto generated feature file for the given postman collection.

[https://github.com/virtualansoftware/idaithalam-contract-testing-demo/blob/master/conf/virtualan-contract.feature](https://github.com/virtualansoftware/idaithalam-contract-testing-demo/blob/master/conf/virtualan-contract.feature)

## Demo Code Base:
> Sample application with postman collection.

[https://github.com/virtualansoftware/idaithalam-contract-testing-demo](https://github.com/virtualansoftware/idaithalam-contract-testing-demo)

----