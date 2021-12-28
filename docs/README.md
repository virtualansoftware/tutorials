# Virtualan

Virtualan Software is a Product development company that helps to solve customer problems in a cost-effective manner using a unique approach.   

## Products

- Service virtualization:
    - **Simple Use case scenarios - Why use Service Virtualization:**
    | Actor      | Usecase       |   |
    | -----------|:--------------|:---------|
    | As a Integration Developer | Build/Modify unit tests for Test Driven Development  ( i.e. prior to integrated code and checkin)| [More](Developer-usecase.md)|
    | As a Test Engineer  | Build and execute a full test suite, or incrementally add to a test suite, prior to service changes being deployed  | [More] |
    | As a API Partner/ProductOwner | Evaluate service contracts prior to publishing on your Developer Portal.  Generate sample payloads before service development is complete | [More] |

    Virtualan employs [Service virtualization as code](https://www.linkedin.com/groups/13908063/) to maximize benefits and reduce your efforts. 
    - Virtualan features:
        - a cloud-ready solution
        - Light-weight, simple setup and configuration
        - test data creation using a Swagger based UI or a REST API 
        - It’s not just mocking, there's more than mocking 
        - simulate any software component by deploying a virtualized service
        - perform service contract validation without any coding or configuration required
        - deploy in any environment via CI/CD tooling in minimal time
        - integrate with test automation tools
    - [Virtualan-plugin](https://github.com/virtualansoftware/virtualan/tree/master/modules/virtualan-plugin)
        - Virtualan-plugin is a Service virtualization tool, driven by  open-source software, specifically the Open API Interface spec.
    - [Virtualization](https://github.com/virtualansoftware/virtualan/tree/master/modules/virtualization)
        - Service virtualization is the simulation of the behavior of software components that are unavailable or otherwise restricted during the preproduction stage of the software development lifecycle. Supports Open API(Rest), Kafka, AMQ, Soap and IBM MQ.
     - [API first strategy with spring boot application development](Api-first.md) 
        - Build your contract 
        - Generate your code as a Mock service
        - Develop your service using the generated Mock service as your base (for Spring boot services)
        - Build your application to use the Mock
        - Virtualize the service in your contract (partially or entirely)
- [Idaithalam - Lowcode automation](https://github.com/virtualansoftware/idaithalam)
    - In Idaithalam, Idai means "Interface" and Thalam means "Platform".
    - Low code Test automation framework using cucumber and supports Behavior Driven Development (BDD). Can build test cases using Excel and Virtualan collection. It allows to build and test api workflow in minutes.
- [Cucumblan](https://github.com/virtualansoftware/cucumblan)
    - Cucumblan is a test automation framework that supports Behavior Driven Development (BDD), allowing users to create feature using predefined step definition with low code. I t works based on the Gherkin Domain Specific Language (DSL). This simple but powerful api framework while keeping it comprehensible to even non-technical(product owner, business analyst and domain experts) users.
- [Idaithalam-server](https://github.com/virtualansoftware/idaithalam-server)
    - Idaiserver is a reference implementation of Idaithalam.It implements the API services to execute contract tests based on Excel.
        Idaiserver provides APIs for 
        - uploading a new contract
        - run the test
        - update the configuration
        - re-run existing test configurations
        - get the report
        - get the feature file
        - get the configuration properties file
        - get a test summary.
- [Mapson & Csvson](https://github.com/virtualansoftware/mapson)
    - **Mapson**
        - MAPson library represents JSON as MAP with key as Json-Path. MAPson provides options to work json as MAP. It removes technical dependency between gherkin and Json. This would help lot more for Product Owner/Business analysts(Non technical team members) can create a features without knowing the details and simply using JSON hierarchy
    - **Csvson**
        -  Mapson library represents JSON as comma separted values(CSV). CSVson provides options to work json as CSV. It removes technical dependency between gherkin and Json. This would help lot more for Product Owner/Business analysts(Non technical team members) can create a features without knowing the details and simply using JSON hierarchy

## Examples
- [OpenAPI Service Virtualization](https://github.com/virtualansoftware/service-virtualization-openapi)
- [AsyncAPI Service Virtualization](https://github.com/virtualansoftware/AsyncAPI-Virtualization) 
- [Microservices-lowcode-testautomation Project](https://github.com/virtualansoftware/microservices-lowcode-testautomation) 

----
