/* Requires the Docker Pipeline plugin */
pipeline {
    agent {
        docker {
            image 'node:24.11.1-alpine3.22'
        }
    }
    stages {
        stage('build') {
            steps {
                sh 'node --version'
            }
        }
        stage ('Static Analysis') {
            steps {
                sh ' ./node_modules/eslint/bin/eslint.js -f checkstyle src > eslint.xml'
            }
            post {
                always {
                    recordIssues enabledForFailure: true,
                    aggregatingResults: true,
                    tool: checkStyle(pattern: 'eslint.xml')
                }
            }
        }
    }
}