# API First with Spring boot:

[![Maven Central](https://img.shields.io/maven-central/v/io.virtualan/virtualan-plugin.svg?label=Maven%20Central)](https://search.maven.org/search?q=g:%22io.virtualan%22%20AND%20a:%22virtualan-plugin%22) 



## 1. How does Virtualan work? 
Virtualan is built with the Spring boot framework, and quickly converts an API service to a Virtualized service simply by adding a couple of annotations. **_Simply as Virtualized service_** currently supports Spring-boot based Rest service(API) with **Spring-RestController** or **CXF-Jaxrs** as Virtualized service with **@VirtualService** and **@ApiVirtual** annotations.

### Add the "virtualan-plugin" dependency
	• Add "virtualan-plugin" dependency in the pom.xml  
		<dependency>
			<groupId>io.virtualan</groupId>
			<artifactId>virtualan-plugin</artifactId>
			<version>${virtualan.version}</version>
		</dependency>
		

### Add @VirtualService and @ApiVirtual annotations
	• @VirtualService - Annotation should be added in the class level
	• @ApiVirtual - Annotation should be added in the method level that the API would you like to Virtualize.
	

### Service Data base setup (Optional)
	• Add the entries in the **application.properties** of the database to be used to store the test data (Example: hsql with in memory DB).
		virtualan.datasource.driver-class-name=<org.hsqldb.jdbcDriver>
		virtualan.datasource.jdbc-url=<jdbc:hsqldb:mem:dataSource>
		virtualan.datasource.username=<sa>
		virtualan.datasource.password=<>
    
## 2. Api First
The API first (or design first) approach focuses on the API’s design before starting to write the code. The resulting code will be the output of our design, which means that the first thing we need to do is to write the API specification (OpenApi). That is, we will design our API contract and how the service should work before starting to write any line of code. 

> https://github.com/virtualansoftware/virtualan-api-first-openapi/ 


### Open API generator
> Generate the open api spring boot rest application using the following plugin for the Open API contract 

```mvn
<plugin>
    <groupId>org.openapitools</groupId>
    <artifactId>openapi-generator-maven-plugin</artifactId>
    <version>5.0.0</version>
    <executions>
        <execution>
            <goals>
                <goal>generate</goal>
            </goals>
            <configuration>
                <inputSpec>${project.basedir}/src/main/resources/spec/openapi-spec.yml</inputSpec>
                <generatorName>spring</generatorName>
                <apiPackage>${project-base-package}</apiPackage>
                <modelPackage>${project-base-package}.model</modelPackage>
                <invokerPackage>${project-base-package}.swagger</invokerPackage>
                <skipValidateSpec>false</skipValidateSpec>
                <strictSpec>true</strictSpec>
                <ignoreFileOverride>${project.basedir}/.openapi-generator-ignore</ignoreFileOverride>
                <generateApiDocumentation>false</generateApiDocumentation>
                <generateModelDocumentation>true</generateModelDocumentation>
                <configOptions>
                    <configPackage>${project-base-package}.swagger</configPackage>
                </configOptions>
            </configuration>
        </execution>
    </executions>
</plugin>
```

### Add Depandency to virtualize
> Add the following dependency for service virtulization

```mvn
<!-- START Virtual Service API support -->
<dependency>
    <groupId>io.virtualan</groupId>
    <artifactId>virtualan-plugin</artifactId>
    <version>${virtualan.version}</version>
</dependency>

<!-- HyperSQL DB -->
<dependency>
    <groupId>org.hsqldb</groupId>
    <artifactId>hsqldb</artifactId>
    <version>2.5.0</version>
</dependency>
<!-- END Virtual Service API support -->
```

### Virtualize Generated API
Add **\<virtualService>true\</virtualService>** under configOptions and this will generate code and create service virtulization or Mocking
> Virtualized code: https://github.com/virtualansoftware/virtualan-api-first-openapi/  

```mvn
<plugin>
    <groupId>org.openapitools</groupId>
    <artifactId>openapi-generator-maven-plugin</artifactId>
    <version>5.0.0</version>
    <executions>
        <execution>
            <goals>
                <goal>generate</goal>
            </goals>
            <configuration>
                <inputSpec>${project.basedir}/src/main/resources/spec/openapi-spec.yml</inputSpec>
                <generatorName>spring</generatorName>
                <apiPackage>${project-base-package}</apiPackage>
                <modelPackage>${project-base-package}.model</modelPackage>
                <invokerPackage>${project-base-package}.swagger</invokerPackage>
                <skipValidateSpec>false</skipValidateSpec>
                <strictSpec>true</strictSpec>
                <importMappings>Problem=org.zalando.problem.Problem</importMappings>
                <ignoreFileOverride>${project.basedir}/.openapi-generator-ignore</ignoreFileOverride>
                <generateApiDocumentation>false</generateApiDocumentation>
                <generateModelDocumentation>true</generateModelDocumentation>
                <configOptions>
                    <configPackage>${project-base-package}.swagger</configPackage>
                    <!-----START: FOLLOWING TAG converts and generate OPEN API AS MOCK SERVICE  --->
                    <virtualService>true</virtualService>
                    <!-----END--->
                </configOptions>
            </configuration>
        </execution>
    </executions>
</plugin>
```

## **How it could be useful**
In the Agile world, we need to develop & Test (Micro)services in parallel. How can a QA or Development team work in parallel on any APIs before the real Microservices are developed? Virtualized service comes into the picture to help both teams.

------