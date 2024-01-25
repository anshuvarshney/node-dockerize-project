pipeline {
    agent any
    stages {
        stage("checkout"){
            steps{
                checkout scm
            }
        }

        stage("Test"){
            steps{
                sh "sudo npm install"
                sh "npm test"
            }
        } 

        stage("Build"){{
            steps{
                  sh "npm rn build"
            }
        }   
     
        stage("Build Image"){
            steps{
                 sh "docker build -t my-node-app:1.0 .
            }               

        }   
 }                       
                       
