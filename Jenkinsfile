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
    post {
        always {
          // Warnings Next Generation Plugin
          // https://jenkins.io/doc/pipeline/steps/warnings-ng/
          // https://github.com/jenkinsci/warnings-ng-plugin/blob/master/doc/Documentation.md
          // https://github.com/jenkinsci/warnings-ng-plugin/blob/master/SUPPORTED-FORMATS.md
          recordIssues enabledForFailure: true, tools: [esLint()]
          recordIssues enabledForFailure: true, tool: esLint()
          recordIssues (
            enabledForFailure: true
            tool: esLint()
          )
        }
      }
}