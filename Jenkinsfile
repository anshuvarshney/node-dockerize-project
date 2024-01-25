pipeline {
    agent any
    stages{
        stage("checkout"){
            steps{
                checkout scm
            }
        }

        stage("Test"){
            steps{
                sh "sudo apt install npm"
                sh "npm test"
            }
        }

        stage("Build Image"){
            steps{
                sh "docker build -t my-node-app:1.0 ."
            }
        }

        stage("Docker login"){
            steps{
                withCredentials([usernamePassword(credentialsId: 'dreamydevops', passwordVariable: 'dockerhub_passwd', usernameVariable: 'dockerhub_username')]){
                sh "echo ${dockerhub_passwd} | docker login -u ${dockerhub_username} --password-stdin" 
                sh "docker logout"
                }
            
            }
        }

        stage('Push Image to Docker Hub') {         
            steps{                            
                sh 'sudo docker push <dockerhubusername>/<dockerhubreponame>:$BUILD_NUMBER'           
                echo 'Push Image Completed'       
            }            
        }  
    }
}
