pipeline {
  agent any
  stages {
    stage('Clone') {
      steps {
        git(url: 'https://github.com/mikeNieto/CICD-backendApp.git', branch: 'master')
      }
    }
    stage('Build') {
      agent {
        docker {
          image 'gradle'
        }

      }
      steps {
        sh 'make docker'
      }
    }
    stage('Push') {
      steps {
        echo 'push'
      }
    }
    stage('Helm') {
      steps {
        sh 'helm upgrade --install helm/'
      }
    }
  }
}