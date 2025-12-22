/* Requires the Docker Pipeline plugin */
pipeline {

    agent any
    tools {
        nodejs 'NodeJS'
    }
    stages {
        stage('GitHub') {
            steps {
                script {
                    git credentialsId: 'filevault-pipeline', url: 'https://github.com/pr00279/DevOps-Training.git'
                }
            }
        }
        stage('Unit Tests') {
            steps {
                script {
                    sh 'npm install'
                    sh 'npm test'
                }
            }
        }
    }
}