pipeline {
  agent any
  stages {
    stage('Clone') {
      steps {
        git(url: 'https://github.com/mikeNieto/CICD-backendApp.git', branch: 'master')
      }
    }
    stage('Build') {
      steps {
        sh 'gradlew bootJar'
      }
    }
    stage('Push') {
      steps {
        sh 'docker build -t mikenieto/backendapp .'
        sh 'docker push mikenieto/backendapp'
      }
    }
    stage('Helm') {
      steps {
        sh 'helm upgrade backendapp --namespace apps --install ./backendapp'
      }
    }
  }
}