# Initial load

##  Setup Initial load

1. The following properties would be used to setup the initial data for the virtualized service. 
```
virtualan.data.load=<file name from classpath>
```

2. The following information needs to be added in the application.properties file for the virtualized service to setup.
```
server.port=8080
virtualan.datasource.driver-class-name=org.hsqldb.jdbcDriver
virtualan.datasource.jdbcurl=jdbc:hsqldb:mem:dataSource
virtualan.datasource.username=sa
virtualan.datasource.password=
virtualan.application.name=The Service Virtualization Product
virtualan.data.load=initial-load.json
```
3. From the above sample initial-load.json is the file name needs to be a available in the classpath.
   **Example file:** https://github.com/virtualansoftware/virtualan/blob/master/samples/virtualan-openapi-rest/src/main/resources/initial-load.json  

## Create initial set of data
1) Using -[How to populate the data in the system](Mock-data)  prepare the data and follow below process to download the JSON.

2) Navigate to the following URL to load data using REST API : 
[http://localhost:8080/swagger-ui/index.html?url=/yaml/VirtualService/virtualservices.yaml](http://localhost:8080//swagger-ui/index.html?url=/yaml/VirtualService/virtualservices.yaml)

3) Run the [http://localhost:8080/virtualservices](http://localhost:8080/virtualservices)  - Get all Mock service data and download the JSON output and That JSON will be directly loaded as the initial set of data.
4) Now Check-in the JSON in the Virtualized code repository and specify the filename for the "virtualan.data.load" property in the application.properties file.

5) From the next build it will load the data.

6) _**IMPORTANT NOTE:**_     The following fields would be ignored while loading if it was part of the initial load (id, usageCount, priority and lastUsedDateTime)
```   
    "id": 1,
    "usageCount": 0,
    "priority": 0,   
    "lastUsedDateTime": "2020-08-29T21:07:16.466+0000"
```
----