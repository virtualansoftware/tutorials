# API First with Spring boot:

**virtualan-plugin:**  [![Maven Central](https://img.shields.io/maven-central/v/io.virtualan/virtualan-plugin.svg?label=Maven%20Central)](https://search.maven.org/search?q=g:%22io.virtualan%22%20AND%20a:%22virtualan-plugin%22) 

## **Live demo link:**
> **OpenAPI Only:** - [https://live.virtualandemo.com/virtualan-ui](https://live.virtualandemo.com/virtualan-ui) 
 **OpenAPI and SOAP :** [https://sforce.virtualandemo.com/virtualan-ui](https://sforce.virtualandemo.com/virtualan-ui)


## How Virtualan works? : 
Virtualan would be built with spring boot  framework that would convert API service as Virtualized service in matter of adding couple of annotations. **_Simply as Virtualized service_** which currently supports spring-boot based Rest service(API) with **Spring-RestController** or **CXF-Jaxrs** as Virtualized service with **@VirtualService** and **@ApiVirtual** annotations.

## Step (1) : Add the "virtualan-plugin" dependency
	• Add "virtualan-plugin" dependency in the  pom.xml  
		<dependency>
			<groupId>io.virtualan</groupId>
			<artifactId>virtualan-plugin</artifactId>
			<version>${virtualan.version}</version>
		</dependency>
		

### Step (2) :  Add @VirtualService and @ApiVirtual annotations
	• @VirtualService - Annotation should be added in the class level
	• @ApiVirtual - Annotation should be added in the method level that the API would you like to Virtualize.
	

### Step (3) :  Service Data base setup:
	• Add the entries in the **application.properties** of the database to be used to store the test data (Example: hsql with in memory DB).
		virtualan.datasource.driver-class-name=<org.hsqldb.jdbcDriver>
		virtualan.datasource.jdbc-url=<jdbc:hsqldb:mem:dataSource>
		virtualan.datasource.username=<sa>
		virtualan.datasource.password=<>


## API first
The API first is a design first approach will use API’s design before start develoment and start write the code. The generated code will be the output of our api design, which means we need to write the API specification (OpenApi) first. That is, we will generate the API will look like and how it will work before starting to write any line of the code.

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

### Add Depandency needed to virtulize.
> Add the following depandency for service virtulization

```mvn
<!-- START Virtual Service API support -->
<dependency>
    <groupId>io.virtualan</groupId>
    <artifactId>virtualan-plugin</artifactId>
    <version>2.1.10</version>
</dependency>

<!-- HyperSQL DB -->
<dependency>
    <groupId>org.hsqldb</groupId>
    <artifactId>hsqldb</artifactId>
    <version>2.5.0</version>
</dependency>
<!-- END Virtual Service API support -->
```

### Virtalize Generated API:
> Add <virtualService>true</virtualService> under configOptions and this will generate code and create service virtulization or Mocking

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
                    <virtualService>true</virtualService>
                </configOptions>
            </configuration>
        </execution>
    </executions>
</plugin>
```

**How it could be useful:**
In the Agile world, We need to develop (Micro)services & Test the services in parallel. How can tester or development team can develop or test parallel to all the APIs before the real Microservices would be developed? Here Virtualized service comes into the picture.

-------