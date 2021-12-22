# Cucumblan-db

[![Maven Central](https://img.shields.io/maven-central/v/io.virtualan/cucumblan-db.svg?label=Maven%20Central)](https://search.maven.org/search?q=g:%22io.virtualan%22%20AND%20a:%22cucumblan-db%22)

## What is it
Cucumblan-db library contains predefined Gherkin step definition for JDBC testing. Cucumblan-message provides options to Test engineer, Manual Testers and Subject Matter Exports to write feature files without having development excellency. This would **help lot more for Product Owner/Business analysts(Non technical team members) can create features without knowing** the technical details. Simply knowing the Step definitions.
 
## Maven dependency:
 
  ```mvn
    <dependency>
      <groupId>io.virtualan</groupId>
       <artifactId>cucumblan-db</artifactId>
       <version>${cucumblan-db.version}</version>
    </dependency>
  ```  

## Project Code and Live demo link
- [JDBC Project](https://github.com/virtualansoftware/cucumblan/tree/master/modules/cucumblan-db/src/test)

## How to Integrate:

1. cucumblan.properties - Should be added in classpath

> \<RESOURCE>.cucumblan.jdbc.driver-class-name=\<driver> \
> \<RESOURCE>.cucumblan.jdbc.username=\<username> \
> \<RESOURCE>.cucumblan.jdbc.password=\<password> \
> \<RESOURCE>.cucumblan.jdbc.url=\<url> \
 
```properties
employee.cucumblan.jdbc.driver-class-name=org.hsqldb.jdbc.JDBCDriver
employee.cucumblan.jdbc.username=SA
employee.cucumblan.jdbc.password=
employee.cucumblan.jdbc.url=jdbc:hsqldb:mem:employee
```

## Predefined Step Definition

### Predefined Step Definition for DDL
> perform a \<description> create DDL sql on \<RESOURCE>
```
Given perform a employee create DDL sql on employee
    | create table employees (emp_no int, birth_date date,first_name VARCHAR(50),last_name VARCHAR(50), gender VARCHAR(50),hire_date date)  |
```

### Predefined Step Definition Create/Update/Delete
> \<insert/update/delete> the given sql for \<DESCRIPTION> on \<RESOURCE>

```gherkin
When insert the given sql for employees on employee
    |insert into employees (emp_no,birth_date,first_name,last_name, gender,hire_date) values  (1,'1978-01-08','Ethan', 'Gates', 'Male', '2007-10-10')|
    | delete from employees where emp_no = 1    |
```

### Predefined Step Definition - Verify/Select with CSVSON way
> verify details with the given sql for \<DESCRIPTION> on \<RESOURCE>

```gherkin
Then verify details with the given sql for employees on employee
    | select * from employees where emp_no = 1                  |
    | EMP_NO,BIRTH_DATE,FIRST_NAME,LAST_NAME,GENDER,HIRE_DATE   |
    |   i~1,l~253087200000,Ethan,Gates,Male,l~1191992400000          |
```

## Example

```gherkin
  Given perform a employee create DDL sql on employee
        | create table employees (emp_no int, birth_date date,first_name VARCHAR(50),last_name VARCHAR(50), gender VARCHAR(50),hire_date date)  |
    When insert the given sql for employees on employee
        |insert into employees (emp_no,birth_date,first_name,last_name, gender,hire_date) values  (1,'1978-01-08','Ethan', 'Gates', 'Male', '2007-10-10')|
    Then verify details with the given sql for employees on employee
        | select * from employees where emp_no = 1                  |
        | EMP_NO,BIRTH_DATE,FIRST_NAME,LAST_NAME,GENDER,HIRE_DATE   |
        |   i~1,l~253087200000,Ethan,Gates,Male,l~1191992400000          |
    And delete the given sql for employees on employee
        | delete from employees where emp_no = 1    |
````
----