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
        sh 'whoami'
        sh 'gradle --version'
        
      }
      withCredentials([usernamePassword( credentialsId: 'docker-hub-credentials', usernameVariable: 'USER', passwordVariable: 'PASSWORD')]) {
        def registry_url = "registry.hub.docker.com/"
        bat "docker login -u $USER -p $PASSWORD ${registry_url}"
        docker.withRegistry("http://${registry_url}", "docker-hub-credentials") {
            sh 'make docker'
        }
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
