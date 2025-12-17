/* Requires the Docker Pipeline plugin */
pipeline {
    agent {
        docker {
            image 'node:24.11.1-alpine3.22'
        }
    }
    stages {
        stage('test') {
            steps {
                sh 'cd src/azure-sa'
                sh 'npx eslint'
            }
        }
        stage('build') {
            steps {
                sh 'node --version'
            }
        }
    }
}