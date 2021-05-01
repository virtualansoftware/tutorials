Feature: WORKFLOW:API-Testing - API Contract validation status
    Scenario: Load initial set of data
      Given Provided all the feature level parameters from file
    @api
    Scenario: get API testing - GET api call
      Given a user perform a api action
      And add request with given query params
        | tags                   | grey                         |
      And add request with given header params
        | contentType                   | application/json                         |
      When a user get application/json in /api/pets/findByTags resource on api
      Then Verify the status code is 200
      And Verify-all /api/pets/findByTags api includes following in the response
        | photoUrls[0]                 |  string                          |
        | name                 |  Butch                          |
        | id                 |  i~201                          |
        | category.name                 |  Bulldog                          |
        | category.id                 |  i~200                          |
        | status                 |  available                          |
        | tags[0].name                 |  grey                          |
        | tags[0].id                 |  i~201                          |
    @api
    Scenario: post API Testing - POST api call
      Given a user perform a api action
      And add request with given header params
        | contentType                   | application/json                         |
      And Create api with given input
      | photoUrls[0]                   |  string                        |
      | name                   |  doggie                        |
      | id                   |  i~100                        |
      | category.name                   |  string                        |
      | category.id                   |  i~100                        |
      | status                   |  available                        |
      | tags[0].name                   |  string                        |
      | tags[0].id                   |  i~0                        |
      When a user post application/json in /api/pets resource on api
      Then Verify the status code is 200
      And Verify-all /api/pets api includes following in the response
        | photoUrls[0]                 |  string                          |
        | name                 |  doggie                          |
        | id                 |  i~100                          |
        | category.name                 |  string                          |
        | category.id                 |  i~100                          |
        | status                 |  available                          |
        | tags[0].name                 |  string                          |
        | tags[0].id                 |  i~0                          |
      And Verify-by-elements pet for event TEST contains 200 on pet with type JSON
        | name                 |  doggie                          |
        | id                 |  i~200                          |
      And Verify pet for event TEST contains 200 on pet with type JSON
        | id,name, category/id:name,status |
        | i~200,doggie,i~100:string,available |
      And Verify details with the given sql for pet on pet
        | select * from employees where emp_no = 1  |
        | EMP_NO,BIRTH_DATE,FIRST_NAME,LAST_NAME,GENDER,HIRE_DATE |
        | i~1,l~253087200000,ELan,Thangamani,Male,l~1191992400000 |
