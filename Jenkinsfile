pipeline {
     agent any
     stages {
          stage("checkout")
               steps{
                   cheeckout scm
                }
          }

          stage{"Test"}
              steps{
                  sh "sudo npm install"
                  sh "npm test"
               }
          }

          stage{"Build"}{
              steps{
                  sh "npm rn build"
               }
          } 
     }
}
