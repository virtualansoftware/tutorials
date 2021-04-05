# Groovy Scripts

## Build response 
>After Rule, Script takes precedence.

Script would give more control to the service virtualization engineer/Automation Tester/Developer to define mock data based on their conditions.


**Rest Api URL: **. To create script via rest api: https://live.virtualandemo.com/swagger-ui/index.html?url=/yaml/VirtualService/virtualservice.yaml

The following Example usecase from [Microservice-API-Patterns:LakesideMutual](https://github.com/Microservice-API-Patterns/LakesideMutual)
_**Example Reference to the Project: **_
https://github.com/Microservice-API-Patterns/LakesideMutual/blob/master/policy-management-backend/src/main/java/com/lakesidemutual/policymanagement/interfaces/RiskComputationService.java

## Prerequisite
> "type": "Script"   -> Type should be defined as Script

**Must create a script with the following method definition to perform the script execution** 

> def executeScript(mockServiceRequest, responseObject) mockServiceRequest -> RequestObject Handle && responseObject -> Response handle

Script Syntax:
```
def executeScript(mockServiceRequest, responseObject) {
    int age = getAge(mockServiceRequest.getInput().getBirthday());
    String postalCode = mockServiceRequest.getInput().getPostalCode();
    int riskFactor = computeRiskFactor(age, postalCode);
    responseObject.setHttpStatusCode("200");
    responseObject.setOutput(String.valueOf(riskFactor));
    return responseObject.builder();
}
```

## Request data

> "input": {  "birthday" : "1918-10-24",  "postalCode" : "60563"},

To read birthday, postalCode field in the script context : 
1. _**mockServiceRequest.getInput().getBirthday()**_ 
2. _**mockServiceRequest.getInput().getPostalCode()**_      

## Response object 
> responseObject.setHttpStatusCode("200");    
responseObject.setOutput(String.valueOf(riskFactor));  --> Can be set by the JSON string as well if needed.   
return responseObject;

**Example input data to setup the Risk calculation Mock data: via REST API**  and also can be created via Virtualan UI.** 

```json
{
    "httpStatusCode": "200",
    "url": "/riskfactor/compute",
    "method": "POST",
    "input": "{\n  \"**birthday**\" : \"1918-10-24\",\n  \"**postalCode**\" : \"60563\"\n}",
    "rule": " import java.time.*\n\ndef _**executeScript(mockServiceRequest, responseObject)**_ {\n    int age = 
             getAge(_**mockServiceRequest.getInput().getBirthday()**_);\n    String postalCode = **mockServiceRequest.getInput().getPostalCode()**;\n 
             int riskFactor = computeRiskFactor(age, postalCode);\n    responseObject.setHttpStatusCode(\"200\");\n    
             responseObject.setOutput(String.valueOf(riskFactor));\n    return responseObject.builder();\n}\n\ndef getAge(birthday) {\n    
             LocalDate now = LocalDate.now();\n    return Period.between(birthday, now).getYears();\n}\n\ndef computeRiskFactor(age, postalCode) {\n    
             int ageGroupRiskFactor = computeAgeGroupRiskFactor(age);\n    int localityRiskFactor = computeLocalityRiskFactor(postalCode);\n    
             return (ageGroupRiskFactor + localityRiskFactor) / 2;\n}\n\ndef computeAgeGroupRiskFactor(age) {\n    if(age > 90) {\n        
             return 100;\n    } else if(age > 70) {\n        return 90;\n    } else if(age > 60) {\n        return 70;\n    
             } else if(age > 50) {\n        return 60;\n    } else if(age > 40) {\n        return 50;\n    } else if(age > 25) {\n        
             return 20;\n    } else {\n        return 40;\n    }\n}\n\ndef  computeLocalityRiskFactor( postalCodeStr) {\n    
             try{\n\t\tint postalCode = Integer.parseInt(postalCodeStr);\n\t\tif ((postalCode >= 8000 && postalCode < 9000) || (postalCode >= 1000 && 
             postalCode < 2000)) {\n\t\t\treturn 80;\n\t\t} else if (postalCode >= 5000 && postalCode < 6000) {\n\t\t\treturn 10;\n\t\t} else 
             {\n\t\t\treturn 30;\n\t\t}\n\t} catch(NumberFormatException e) {\n\t\t\treturn 0;\n\t\t}\n} ",
    "output": "40",

    "type": "Script",
    "contentType": "JSON",
    "requestType": "REST"
      
}
```

## Formatted Groovy Script
```java
import java.time.*
def executeScript(mockServiceRequest, responseObject) {
    int age = getAge(mockServiceRequest.getInput().getBirthday());
    String postalCode = mockServiceRequest.getInput().getPostalCode();
    int riskFactor = computeRiskFactor(age, postalCode);
    responseObject.setHttpStatusCode("200");
    responseObject.setOutput(String.valueOf(riskFactor));
    return responseObject.builder();
}

def getAge(birthday) {
    LocalDate now = LocalDate.now();
    return Period.between(birthday, now).getYears();
}

def computeRiskFactor(age, postalCode) {
    int ageGroupRiskFactor = computeAgeGroupRiskFactor(age);
    int localityRiskFactor = computeLocalityRiskFactor(postalCode);
    return (ageGroupRiskFactor + localityRiskFactor) / 2;
}

def computeAgeGroupRiskFactor(age) {
    if(age > 90) {
        return 100;
    } else if(age > 70) {
        return 90;
    } else if(age > 60) {
        return 70;
    } else if(age > 50) {
        return 60;
    } else if(age > 40) {
        return 50;
    } else if(age > 25) {
        return 20;
    } else {
        return 40;
    }
}

def  computeLocalityRiskFactor( postalCodeStr) {
    try{
		int postalCode = Integer.parseInt(postalCodeStr);
		if ((postalCode >= 8000 && postalCode < 9000) || (postalCode >= 1000 && postalCode < 2000)) {
			return 80;
		} else if (postalCode >= 5000 && postalCode < 6000) {
			return 10;
		} else {
			return 30;
		}
	} catch(NumberFormatException e) {
			return 0;
		}
}
```

## Reference Links

1. _**Demo Project:**_  https://github.com/virtualansoftware/service-virtualization-openapi
2. _**Initial-load:**_  https://github.com/virtualansoftware/service-virtualization-openapi/blob/master/src/main/resources/initial-load.json#L179
3. _**OpenAPI Contract:**_ https://github.com/virtualansoftware/service-virtualization-openapi/blob/master/src/main/resources/META-INF/resources/yaml/Risk/riskfactor.yaml
4. **Test cases for risk calculation :**  https://github.com/virtualansoftware/service-virtualization-openapi/blob/master/src/test/resources/features/demo/demo.feature#L236
  
----