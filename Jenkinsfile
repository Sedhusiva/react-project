pipeline {
  agent any
  environment {
    DOCKER_CRED = 'dockerhub'
  }
  stages {
    stage('Build and Push Docker Image') {
      steps {
        withCredentials([usernamePassword(credentialsId: "${DOCKER_CRED}",
          passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
          sh 'echo \$DOCKER_PASSWORD | docker login -u \$DOCKER_USERNAME --password-stdin docker.io'
        }
        script {
          echo "Permission for deploy.sh"
          sh 'sudo chmod +x deploy.sh'
          echo "Building the Docker image"
          sh 'sudo ./deploy.sh'
        }
      }
    }
  }
}
