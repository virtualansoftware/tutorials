# Rule

## Setup a Rule 
> Always Rule takes precedence

Defined Rule would be applied for any input data processed by the given rest api and its kind of _**intelligence/smartness**_ applied(validated) on the input request and rejected with the output error message defined in the validation rule.
 
_**Rest Api URL: **_ used to create rule via api
https://live.virtualandemo.com/swagger-ui/index.html?url=/yaml/VirtualService/virtualservices.yaml

live.virtualandemo.com ==> localhost:8080 or your deployed server.
***

## Pre-Requisite
>  "type": "Rule"  --> type should be set as "Rule"

### Validation Rule:1
When the pet identifier is not a valid number(0), Then reject with the error code as "PET_1000" and error message as "Pet identifier is not valid"

> "rule": "input.id == 0"  
==> **Rule can be built using spring SPEL**_   [Refer SPEL Link](https://docs.spring.io/spring/docs/4.3.10.RELEASE/spring-framework-reference/html/expressions.html)

>  "output": { "code": "PET_1000",  "message": "Pet identifier is not valid"}  ==> if the above rule/condition satisfied then the given error code and error message would returned via requested virtualized service.  

>  To build the rule : _**input.id**_==0 and it's part of field in the input request   ==>   "_**input**_":  { "category": { "_**id**_": 100, "name": "Golden-Club" }, "name": "Nemo", "photoUrls": [  "fish.jpg" ], "status": "available", "tags": [ {  "id": 100, "name": "movie" } ]}
```
**Rule Input Data:**
{
    "httpStatusCode": "400",
    "url": "/pets",

    "type": "Rule",
    "method": "POST",
    "rule": "input.id == 0",
    "input": { "category": { "id": 100, "name": "Golden-Club" }, "name": "Nemo", "photoUrls": [  "fish.jpg" ], 
                       "status": "available", "tags": [ {  "id": 100, "name": "movie" } ]},
    "output": { "code": "PET_1000",  "message": "Pet identifier is not valid"},
    "contentType" : "JSON"
  }
```

### Validation Rule:2 
When the age is below 21, Then reject with the error code as "AGE_RESTRICT" and error message as "You are not eligible to purchase"

> "rule": "T(java.time.Period).between(input.dateOfBirth, T(java.time.LocalDate).now()).getYears() < 22" 
==> _**Rule can be built using spring SPEL**_   [Refer SPEL Link](https://docs.spring.io/spring/docs/4.3.10.RELEASE/spring-framework-reference/html/expressions.html)
 
> "output": {  "code": "AGE_RESTRICT",  "message": "You are not eligible to purchase"}"  ==> if the above rule fails then this error message would be send back via virtualized service  

>  To build the rule: _**input.dateOfBirth**_ and it is part of field in the input request   ==>   "_**input**_":  {  "_**dateOfBirth**_": "2009-02-07",  "firstName": "John",  "lastName": "David",  "spokenLanguages": { "additionalProp1": "Tamil",    "additionalProp2": "English"  },  "username": "djohn"}" 
```
**Rule Input Data:**
{
    "httpStatusCode": "400",
    "url": "/persons",
    "type": "Rule",
    "method": "POST",
    "input":  {  "dateOfBirth": "2009-02-07",  "firstName": "John",  "lastName": "David",  
                       "spokenLanguages": { "additionalProp1": "Tamil",    
                       "additionalProp2": "English"  },  "username": "djohn"},
    "rule": "T(java.time.Period).between(input.dateOfBirth, T(java.time.LocalDate).now()).getYears() < 22",
    "output": {  "code": "AGE_RESTRICT",  "message": "You are not eligible to purchase"},
    "contentType": "JSON"
}
```
### Validation Rule:3
When the user sends as pet identifier is not a valid number(0), Then reject with the error code as "PET_1000" and error message as "Pet identifier is not valid"

> "rule": "parameters['petId'] == 0",
==> _**Rule can be built using spring SPEL**_   [Refer SPEL Link](https://docs.spring.io/spring/docs/4.3.10.RELEASE/spring-framework-reference/html/expressions.html)

>  "output": { "code": "PET_1000",  "message": "Pet identifier is not valid"}  ==> if the above rule/condition satisfied then the given error code and error message would returned via requested virtualized service.  

>  To build the rule using : _**parameters['petId']**_==0 and it was part of of field in the availableParams  ==>      "_**availableParams**_": [ { "key": "_**petId**_", "value": "100" } ]
```
**Rule Input Data:**
{
    "httpStatusCode": "400",
    "url": "/pets/{petId}",
    "type": "Rule",
    "requestType": "REST",
    "method": "GET",
    "rule": "parameters['petId'] == 0",
    "output": { "code": "PET_1000",  "message": "Pet identifier is not valid"},
    "availableParams": [
      {
        "key": "petId",
        "value": "100"
	  }
    ],
    "contentType": "JSON"
}
```

## Benefits
1. Pre-build all the rule conditions against the contract and shared with API Partners.
2. Provides capability to upfront share the Error code and Message with API Partners/Consumers.
3. API Partners can run these use cases upfront during as early in the development phase 👍 _**"Shift Left"**_

> Usually these use-cases would be tested only during the real end to end integration testing of SDLC/AGILE development which is late to fix the defect and Some additional cost involved for fixing these integration issues.

## Cost Saving 
- [Reference](https://www.linkedin.com/posts/virtualan-software_service-virtualization-how-this-misunderstood-activity-6695899780691955712-1AJB)    

---