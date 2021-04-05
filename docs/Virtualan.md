# Virtualan-plugin 

 [![Maven Central](https://img.shields.io/maven-central/v/io.virtualan/virtualan-plugin.svg?label=Maven%20Central)](https://search.maven.org/search?q=g:%22io.virtualan%22%20AND%20a:%22virtualan-plugin%22)

# Service As Virtualized
> Virtualan-Plugin is a Service virtualization Product and is the simulation of the behavior of Open API that are unavailable or otherwise restricted during the preproduction stage of the software development lifecycle. Virtualan has RESTAPI and user-friendly interface (UI) to set up the test data for your specific type of Rest APIs. This UI would help Developer, Functional Tester or Automation Tester to set up the test data for their specific use cases and test scenarios 
## Project setup/Live demo

 |  Project |  Demo |
 |----------|:------:|
 |[Service Virtualization Project](https://github.com/virtualansoftware/service-virtualization) | [OpenAPI and SOAP Demo](https://sforce.virtualandemo.com/virtualan-ui) |
  | [Service Virtualization OpenApi only Project](https://github.com/virtualansoftware/service-virtualization-openapi)| [OpenAPI Only Demo](https://live.virtualandemo.com/virtualan-ui) |
 |[Service Virtualization Hl7 FHIR Project](https://github.com/virtualansoftware/HL7-FHIR-service-virtualization-openapi)| [OpenAPI and FHIR Hl7 Demo](https://fhir.virtualandemo.com/virtualan-ui) |


## How it could be useful
In the Agile world, We need to develop (Micro)services & Test the services in parallel. How can tester or development team can develop or test parallel to all the APIs before the real Microservices would be developed? Here Virtualized service comes into the picture.

## Maven dependency
```mvn 
<dependency>
	<groupId>io.virtualan</groupId>
	<artifactId>virtualan-plugin</artifactId>
	<version>${virtualan.version}</version>
</dependency>
``` 
		
## Swagger/OAS Specification

### Why/How to store the mock data in the centralized place:
It always provides a choice to choose your data base and configure(spring-jpa). Need to provide data base information in the Application.properties in the "src/main/resources" directory of your spring boot application: This would requires if you don't want to loose the existing mock data because as you redeploy the code the data would be lost.
     
### Add the following entry for each Interface Spec/Yaml  to be set up as mock service:
> to setup  "petstore.yaml" need to add following entry in the pom.xml. refer the pom.xml for reference
	
```html
<execution>
	<id>pet-service-vs-api</id>
	<goals>
		<goal>generate</goal>
	</goals>
	<configuration>
		<inputSpec>${project.basedir}/src/main/resources/META-INF/resources/yaml/PetStore/petstore.yaml</inputSpec>
		<output>${project.basedir}/target/external/</output>
		<apiPackage>org.openapitools.virtualan.api</apiPackage>
		<modelPackage>org.openapitools.virtualan.to</modelPackage>
		<generatorName>spring</generatorName>
		<configOptions>
							<virtualService>true</virtualService>
					</configOptions>
	</configuration>
</execution>
```

## Database & Build
### Database
> Add the entries in the **application.properties** of the database to be used to store the test data (Example: RDBMS/Oracle/Mysql/hsql with in memory DB).
```properties	
virtualan.datasource.driver-class-name=<org.hsqldb.jdbcDriver>
virtualan.datasource.jdbc-url=<jdbc:hsqldb:mem:dataSource>
virtualan.datasource.username=<sa>
virtualan.datasource.password=<>
```
### build
  - mvn clean install  
  - If you have any proxy issue use this command:  mvn -Dhttps.protocols=TLSv1,TLSv1.1,TLSv1.2 clean install 
  - Run using standalone JAR:
  - java -jar target/\<virtualan-pet>.jar         
  - To set up  data:    
	- [Using Virtualan-UI](Mock-data)
	- [open API Contract](https://github.com/virtualansoftware/virtualan/blob/master/modules/virtualan-plugin/src/main/resources/virtualservices.yaml)
	- Using Virtualan-Rest service: 
		[for automation usecases](https://github.com/virtualansoftware/virtualan-openapi-demo/blob/master/src/test/resources/features/demo/demo.feature)

  - Invoke Virtualan UI:  			
	- Navigate to http://localhost:8080/virtualan-ui.html 
	- More details about the user interface refer: https://github.com/virtualansoftware/virtualan/wiki 	


## What would be the benefits for?

### Development team
* If Services needs to be connected to 1 or more microservices in the development/Testing Environment if the other dependent services would not be available at the time.
* If the dependent services contract had changed then the new changes(implementation) may not be available in day-1 of the sprint.
* If Need to create several use-case scenarios during the development phase even though the dependent service(s) would not be available or not developed yet..
* end etc..

###  Testing team(Shift left approach) 
* **Start developing automation scripts in day-1** of the sprint in parallel with service implementation* .
* Develop and test right away.
* Prepare all the test scenarios and test cases and **test/validate all the test scripts before the actual service** is ready.
* Tester can create all scenario and including error scenarios and create automated test cases before the service is ready.
* Once the real service is ready, just switch the endpoint to real service and validate all the test-cases in a minutes. 
* And etc..

**Overview:**
How developer to make and deploy the (newly developing) spring boot application interface with stub as Virtualized service. How this would helps team to proceed with "Shift Left"  Strategy. 

**What is Shift left(Wikipedia):**
Shift left testing is an approach to software testing and system testing in which testing is performed earlier in the lifecycle (i.e., moved left on the project timeline). It is the first half of the maxim "Test early and often."

----