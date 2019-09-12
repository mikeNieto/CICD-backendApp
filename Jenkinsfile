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
        sh './gradlew clean build'
      }
    }
    stage('Push') {
      steps {
        withDockerRegistry([ credentialsId: "docker-hub-credentials", url: "" ]) {
          sh 'docker build -t mikenieto/backendapp .'
          sh 'docker push mikenieto/backendapp'
        }
      }
    }
    stage('Helm') {
      steps {
        sh 'helm upgrade backendapp --install ./backendapp'
      }
    }
  }
}
