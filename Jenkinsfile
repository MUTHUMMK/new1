pipeline{
    agent any
    parameters {
        credentials credentialType: 'com.cloudbees.jenkins.plugins.sshcredentials.impl.BasicSSHUserPrivateKey', defaultValue: 'apache', name: 'ssh', required: false
}
    stages{
        stage('git clone'){
            steps{
                git branch: 'main', url: 'https://github.com/MUTHUMMK/Automation.git'
            }

        }
        stage('build docker image'){
            steps{
                script{
                    sh 'docker build -t webapp .'
                }
            }
        }
        stage('push image'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'dockerhub-pw', variable: 'dockerhub')]) {
                    sh 'docker login -u muthummkdh -p ${dockerhub}'
                    }
                    sh 'docker tag webapp muthummkdh/apache1'
                    sh 'docker push muthummkdh/apache1'
                }
            }
        }
        stage('deploy apche server'){
            steps{
                sshagent(['apache']) {
                    sh 'scp -o StrictHostKeyChecking=no index.html ubuntu@54.169.50.131:/var/www/html/'

}
            }
        }
  
    } 
}