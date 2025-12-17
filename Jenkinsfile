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
                sh 'pwd'
                sh 'ls'
                sh 'cd src/azure-sa'
                sh 'pwd'
                sh 'npx eslint'
            }
        }
        stage('build') {
            steps {
                sh 'node --version'
            }
        }
        stage ('Static Analysis') {
            steps {
                sh 'sudo chown -R 502:20 "/Users/phoeberevolta/.nvm/versions/node/v22.15.0/bin/npm/opt/homebrew/bin/npm"'
                sh ' ./node_modules/eslint/bin/eslint.js -f checkstyle src > eslint.xml'
            }
            post {
                always {
                    recordIssues enabledForFailure: true, aggregatingResults: true, tool: checkStyle(pattern: 'eslint.xml')
                }
            }
        }
    }
}