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
                sh "docker logout"    
                sh "echo ${dockerhub_passwd} | docker login -u ${dockerhub_username} --password-stdin" 
                }
            }
        }

        stage('Push Image to Docker Hub') {         
            steps{          
                sh "docker tag my-node-app:1.0 dreamydevops/my-node-app:1.0"
                sh "docker push dreamydevops/my-node-app:1.0"           
                echo "Push Image Completed"       
            }            
        }

         post {
            always {
               slackSend channel: '#ruby', color: 'good', message: 'build success full', teamDomain: '#devops', tokenCredentialId: 'slack' 
            }
        }  
    }
}
