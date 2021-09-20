<h1 align="center">Idaithalam - Pipeline </h1>

## Project reference:

> [View - Idaithalam Demo](https://github.com/virtualansoftware/microservices-lowcode-testautomation)

## 1. Jenkins
> FileName:  Jenkinsfile

```groovy
pipeline {
    agent any
    
    environment {
        IDAITHALAM               = 'PROD'
        IDAITHALAM_EXECUTION_ENV = 'test'
    }
    
    tools {
        maven "Maven"
    }
    
    stages {
        stage ('Compile Stage') {
            steps {
                bat 'mvn clean compile'
            }
        }
        stage ('Testing Stage') {
            steps {
                
                    bat 'mvn test'
            }
        }
        
    }

    post {
            always {
                cucumber '**/cucumber-*.json'
            }
        }   
}

````

## 2. Azure Devops

>  FileName:  azure-pipelines.yml

```yml
# Maven
# Build your Java project and run tests with Apache Maven.
# Add steps that analyze code, save build artifacts, deploy, and more:
# https://docs.microsoft.com/azure/devops/pipelines/languages/java
trigger:
- main
pool:
vmImage: ubuntu-latest
steps:
- task: Maven@3
    inputs:
    mavenPomFile: 'pom.xml'
    mavenOptions: '-Xmx3072m'
    javaHomeOption: 'JDKVersion'
    jdkVersionOption: '1.8'
    jdkArchitectureOption: 'x64'
    publishJUnitResults: true
    testResultsFiles: '**/surefire-reports/TEST-*.xml'
    goals: 'test'
- task: PublishCucumberReport@1
    inputs:
    jsonDir: .target/idaithalam
    outputPath: .target/idaithalam

```