/* Requires the Docker Pipeline plugin */
pipeline {

    agent any
    triggers {
        githubPush()
    }
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
                    sh 'npm install express multer dotenv @azure/storage-blob'
                    sh 'ls'
                    sh 'cd src/azure-sa'
                    sh 'pwd'
                    sh 'npx eslint'
                }
            }
        }
    }
}