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
        sh 'make docker'
      }
    }
    stage('Push') {
      steps {
        withDockerRegistry([ credentialsId: "docker-hub-credentials", url: "" ]) {
          sh 'docker push mikenieto/backendapp'
        }
      }
    }
    stage('Helm') {
      steps {
        sh 'helm upgrade --install helm/'
      }
    }
  }
}
