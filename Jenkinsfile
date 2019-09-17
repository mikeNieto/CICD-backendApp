pipeline {
  agent any
  stages {
    stage('Clone') {
      steps {
        input 'Deploy to Prod'
        git(url: 'https://github.com/mikeNieto/CICD-backendApp.git', branch: 'master')
      }
    }
    stage('Build') {
      steps {
        sh 'gradle bootJar --no-daemon'
      }
    }
    stage('Push') {
      steps {
        withDockerRegistry(credentialsId: 'docker-hub-credentials', url: 'https://index.docker.io/v1/') {
          sh 'docker build -t mikenieto/backendapp .'
          sh 'docker push mikenieto/backendapp'
        }

      }
    }
    stage('Helm') {
      steps {
        sh 'helm upgrade backendapp --namespace apps --install ./backendapp'
      }
    }
  }
}