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

        stage("Docker Push"){
            steps{
                withCredentials([usernamePassword(credentialsID: 'docker_cred', passwordVariable: 'anshu6395', usernameVariable: 'dreamydevops')]){
                    sh "docker login"
                    sh "docker tag my-node-app:1.0 dreamydevops/my-node-app:1.0"
                    sh "docker push dreamydevops/my-node-app:1.0"
                    sh "docker logout"
                }
            }


        }
    }
}
