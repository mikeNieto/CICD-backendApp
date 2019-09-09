pipeline {
  agent any
  stages {
    stage('Clone') {
      steps {
        git(url: 'https://github.com/mikeNieto/CICD-backendApp.git', branch: 'master')
        sh 'ls -la /home/jenkins/'
        sh '''echo $GIT_COMMIT
echo $GIT_BRANCH
echo $BUILD_ID
echo $BRANCH_NAME
'''
        sh 'env'
        sh 'whoami'
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