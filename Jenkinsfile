pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
               git branch: 'main',
               url: 'https://github.com/Sedhusiva/react-project.git'
            }
        }

        stage('Build and Push Docker Image') {
                steps {
                withCredentials([usernamePassword(credentialsId: "${DOCKER_CRED}",
                passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')])
                {
                sh 'echo \$DOCKER_PASSWORD | docker login -u \$DOCKER_USERNAME --password-stdin docker.io'
                }
                script{
                sh 'sudo chmod +x build.sh'
                sh 'sudo chmod +x deploy.sh'

                // Build the Docker image using the build script
                sh './deploy.sh'
                }

              
            }
        }
    }
}
