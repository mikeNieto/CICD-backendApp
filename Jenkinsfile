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
        sh 'kubectl get nodes'
      }
    }
    stage('Build') {
      steps {
        sh 'make docker'
        sh 'whoami'
        sh 'gradle --version'
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
