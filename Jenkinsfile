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
                sh "docker build -t dreamydevops/my-node-app:1.0 ."
            }
        }

        stage('Push Image to Docker Hub') {         
            steps{                            
                sh 'sudo docker push dreamydevopsmy-node-app:1.0'           
                echo 'Push Image Completed'       
            }            
        }  
    }
}
