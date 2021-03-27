Feature: WORKFLOW:API-Testing-Sheet2-Duplicate - API Contract validation status
    Scenario: Load initial set of data
      Given Provided all the feature level parameters from file
    @bin
    Scenario: Read the API token for bin
      Given a user perform a api action
      And basic authentication with [okta_user_id.bin] and [okta_user_password.bin]
      When a user post application/json in api_token resource on okta_token.bin
      Then Verify the status code is 200
      And Store the access_token value of the key as AccessToken.bin
    @elan @test @bin
    Scenario: EDI-271 API test - POST api call
      Given a user perform a api action
      And Bearer auth with [AccessToken.bin] token
      And Add the grey value of the key as tag
      And add request with given header params
        | contentType                   | application/xml                         |
        | VirtualanStdType                   | EDI-271                         |
       And add request data inline with text/xml given input
        | <?xml version="1.0" encoding="utf-8"?> |
        | <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"> |
        | <soap:Body> |
        | <request> |
        | ISA*00*Authorizat*00*Security I*ZZ*Interchange Sen*ZZ*Interchange |
        | Rec*141001*1037*^*00501*000031033*0*T*:~ |
        | GS*HS*Sample Sen*Sample Rec*20141001*1037*123456*X*005010X279A1~ |
        | ST*270*1234*005010X279A1~ |
        | BHT*0022*13*10001234*20141001*1319~ |
        | HL*1**20*1~ |
        | NM1*PR*2*ABC COMPANY*****PI*842610001~ |
        | HL*2*1*21*1~ |
        | NM1*1P*2*BONE AND JOINT CLINIC*****XX*1234567893~ |
        | HL*3*2*22*0~ |
        | TRN*1*93175-0001*9877281234~ |
        | NM1*IL*1*SMITH*ROBERT****MI*11122333301~ |
        | DMG*D8*19430519~ |
        | DTP*291*D8*20141001~ |
        | EQ*30~ |
        | SE*13*1234~ |
        | GE*1*123456~ |
        | IEA*1*000031033~ |
        | </request> |
        | </soap:Body> |
        | </soap:Envelope> |
      When a user post text/xml in /bin/3f64e65d-c657-42d5-bcc9-5b13e71ca493 resource on bin
      Then Verify the status code is 200
      And Verify-standard EDI-271 all inline /bin/3f64e65d-c657-42d5-bcc9-5b13e71ca493 api includes following in the response
        | <soap:envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"> |
        | <soap:body> |
        | <request> |
        | ISA*00*Authorizat*00*Security I*ZZ*Interchange Sen*ZZ*Interchange Rec*141001*1037*^*00501*000031033*0*T*:~ |
        | GS*HS*Sample Sen*Sample Rec*20141001*1037*123456*X*005010X279A1~ |
        | ST*270*1234*005010X279A1~ |
        | BHT*0022*13*10001234*20141001*1319~ |
        | HL*1**20*1~ |
        | NM1*PR*2*ABC COMPANY*****PI*842610001~ |
        | HL*2*1*21*1~ |
        | NM1*1P*2*BONE AND JOINT CLINIC*****XX*1234567893~ |
        | HL*3*2*22*0~ |
        | TRN*1*93175-0001*9877281234~ |
        | NM1*IL*1*SMITH*ROBERT****MI*11122333301~ |
        | DMG*D8*19430519~ |
        | DTP*291*D8*20141001~ |
        | EQ*30~ |
        | SE*13*1234~ |
        | GE*1*123456~ |
        | IEA*1*000031033~ |
        | </request> |
        | </soap:body> |
        | </soap:envelope> |
    @pet @test @api
    Scenario: get API testing - GET api call
      Given a user perform a api action
      And basic authentication with [basic_auth_user_id.api] and [basic_auth_password.api]
      And add request with given query params
        | tags                   | [tag]                         |
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
      And Store the id value of the key as petId
      And Store the name value of the key as petName
      And Store the category.name value of the key as category_name
    @pet @test @api
    Scenario: post API Testing - POST api call
      Given a user perform a api action
      And Add the [petId] value of the key as Id
      And Add the doggie value of the key as petName
      And add request with given header params
        | contentType                   | application/json                         |
      And Create api with given input
        | photoUrls[0]                   |  string                        |
        | name                   |  [petName]                        |
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
