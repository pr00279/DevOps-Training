/* Requires the Docker Pipeline plugin */
pipeline {

    agent any
    stages {
        stage('GitHub') {
            steps {
                script {
                    git credentialsId: 'filevault-pipeline', url: 'https://github.com/pr00279/DevOps-Training.git'
                }
            }
        }
    }
}