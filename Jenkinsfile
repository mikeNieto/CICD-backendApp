pipeline {
  agent {
    docker {
      image 'mikenieto/jenkins-slave'
    }

  }
  stages {
    stage('Clone') {
      steps {
        git(url: 'https://github.com/mikeNieto/CICD-backendApp.git', branch: 'master')
        sh 'ls -la /home/jenkins/'
      }
    }
    stage('Build') {
      steps {
        sh 'gradle --version'
        sh 'make docker'
      }
    }
    stage('Push') {
      steps {
        sh 'docker push mikenieto/backendapp'
      }
    }
    stage('Helm') {
      steps {
        sh 'helm install helm/'
      }
    }
  }
}