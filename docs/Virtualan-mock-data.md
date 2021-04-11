# Data setup API and UI

## Request Matching
* End point Rest URL
* HTTP Verbs
* Query/Path/Header parameters
* Request message body

## To Access Virtualan UI
1)	Navigate to Virtualan UI with following URL: http://localhost/virtualan-ui.html#/
    ![Virtualan Home Page](https://raw.githubusercontent.com/virtualansoftware/virtualan/master/modules/virtualan-plugin/src/main/resources/META-INF/resources/static/img/tutorials/Home..png)
2)	From “Virtual Service” menu:  select “Add Mock” drop-down:
3)	Select appropriate API operation  that would need to set up
4)	This User interface would be grouped by API’s parent resource:
5)	For this case, it would be “pets” with different APIs
    ![](https://raw.githubusercontent.com/virtualansoftware/virtualan/master/modules/virtualan-plugin/src/main/resources/META-INF/resources/static/img/tutorials/Add_mock.png)
 
## 	Set up data for POST API
a)	Set up the data for /pets – POST API
    ![](https://raw.githubusercontent.com/virtualansoftware/virtualan/master/modules/virtualan-plugin/src/main/resources/META-INF/resources/static/img/tutorials/Post/Post_1.png)
b)	Populate the Request data with “Mock Request Body:”  test area and Response would be in the “Mock Response:”.
    ![](https://raw.githubusercontent.com/elan-venture/virtualan/blob/virtualan-changes/modules/virtualan-plugin/src/main/resources/META-INF/resources/static/img/tutorials/Post/Post_2.png)
c)	Provided the above data, click on “Add” so that the mock response will be added.

d)	A success message will be seen after you click on “Add”.
    ![](https://raw.githubusercontent.com/virtualansoftware/virtualan/master/modules/virtualan-plugin/src/main/resources/META-INF/resources/static/img/tutorials/Post/Post_3.png)
e)	If you add the same “Request Test Data” again it would fail with the **“Data already exists”**.
    ![](https://raw.githubusercontent.com/virtualansoftware/virtualan/master/modules/virtualan-plugin/src/main/resources/META-INF/resources/static/img/tutorials/Post/Post_4.png)
f)	Validation of the “Post” /pets API in postman(any Rest client):
1.	Open the Postman application and select http method as “Post”
2.	Enter the URL http://localhost/api/pets  
3.	Enter the same Request information would be used to create the “Test Data”
    ![](https://raw.githubusercontent.com/virtualansoftware/virtualan/master/modules/virtualan-plugin/src/main/resources/META-INF/resources/static/img/tutorials/Post/Post_5.png)
4.	Response for the above “Post” API /pets request. 
    ![](https://raw.githubusercontent.com/virtualansoftware/virtualan/master/modules/virtualan-plugin/src/main/resources/META-INF/resources/static/img/tutorials/Post/Post_6.png)
 
## 	Set up data for GET API
a)	Set up the data for /pets/{id} – GET API 
    ![](https://raw.githubusercontent.com/virtualansoftware/virtualan/master/modules/virtualan-plugin/src/main/resources/META-INF/resources/static/img/tutorials/Get/Get_1.png)
b)	Populate the Request data in PathParam and Respose would be in the “Mock Respose:”
    ![](https://raw.githubusercontent.com/virtualansoftware/virtualan/master/modules/virtualan-plugin/src/main/resources/META-INF/resources/static/img/tutorials/Get/Get_2.png)
c)	Provided the above data, click on “Add” so that the mock response will be added.

d)	A success message will be seen after you click on “Add”.
    ![](https://raw.githubusercontent.com/virtualansoftware/virtualan/master/modules/virtualan-plugin/src/main/resources/META-INF/resources/static/img/tutorials/Get/Get_3.png)
e)	Validation of the “GET” /pets/7001 API in postman(any Rest client):
1.	Open the Postman application and select http method as “Get”
2.	Enter the URL http://localhost/api/pets/7001  
    ![](https://raw.githubusercontent.com/virtualansoftware/virtualan/master/modules/virtualan-plugin/src/main/resources/META-INF/resources/static/img/tutorials/Get/Get_4.png)
3.	Response for the above “Get” API /pets request. 
    ![](https://raw.githubusercontent.com/virtualansoftware/virtualan/master/modules/virtualan-plugin/src/main/resources/META-INF/resources/static/img/tutorials/Get/Get_5.png)
 
##	Set up data for PUT API
a)	Set up the data for /pets/{petId} – PUT API
    ![](https://raw.githubusercontent.com/virtualansoftware/virtualan/master/modules/virtualan-plugin/src/main/resources/META-INF/resources/static/img/tutorials/Put/Put_1.png)
b)	Populate the Request data with “Path Param” and “Mock Request Body:”  and Expected respose would be in the “Mock Respose:”.
    ![](https://raw.githubusercontent.com/virtualansoftware/virtualan/master/modules/virtualan-plugin/src/main/resources/META-INF/resources/static/img/tutorials/Put/Put_2.png)
c)	Provided the above data, click on “Add” so that the mock response will be added.

d)	A success message will be seen after you click on “Add”.
    ![](https://raw.githubusercontent.com/virtualansoftware/virtualan/master/modules/virtualan-plugin/src/main/resources/META-INF/resources/static/img/tutorials/Put/Put_3.png)
e)	Validation of the “PUT” /pets/7001 API in postman(any Rest client):
1.	Open the Postman application and select http method as “Put”
2.	Enter the URL http://localhost/api/pets/7001
    ![](https://raw.githubusercontent.com/virtualansoftware/virtualan/master/modules/virtualan-plugin/src/main/resources/META-INF/resources/static/img/tutorials/Put/Put_4.png)
3.	Response for the above “Put” API /pets request. 
    ![](https://raw.githubusercontent.com/virtualansoftware/virtualan/master/modules/virtualan-plugin/src/main/resources/META-INF/resources/static/img/tutorials/Put/Put_5.png)
 
## 	Set up data for DELETE API
a)	Set up the data for /pets/{id} – Delete API 
    ![](https://raw.githubusercontent.com/virtualansoftware/virtualan/master/modules/virtualan-plugin/src/main/resources/META-INF/resources/static/img/tutorials/Delete/Delete_1.png)
b)	Populate the Request data in PathParam and expected response in the “Mock Response:”
    ![](https://raw.githubusercontent.com/virtualansoftware/virtualan/master/modules/virtualan-plugin/src/main/resources/META-INF/resources/static/img/tutorials/Delete/Delete_2.png)
c)	Provided the above data, click on “Add” so that the mock response will be added.

d)	A success message will be seen after you click on “Add”.
    ![](https://raw.githubusercontent.com/virtualansoftware/virtualan/master/modules/virtualan-plugin/src/main/resources/META-INF/resources/static/img/tutorials/Delete/Delete_3.png)
e)	Validation of the “DELETE” /pets/7001 API in postman(any Rest client):
1.	Open the Postman application and select http method as “Delete”
2.	Enter the URL http://localhost/api/pets/7001  
    ![](https://raw.githubusercontent.com/virtualansoftware/virtualan/master/modules/virtualan-plugin/src/main/resources/META-INF/resources/static/img/tutorials/Delete/Delete_4.png)
3.	Response for the above “Delete” API /pets request. 
    ![](https://raw.githubusercontent.com/virtualansoftware/virtualan/master/modules/virtualan-plugin/src/main/resources/META-INF/resources/static/img/tutorials/Delete/Delete_5.png)

----
