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
      }
    }
    stage('Build') {
      agent {
        docker {
          image 'mikenieto/jenkins-slave'
        }

      }
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