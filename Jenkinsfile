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
                // Grant executable permissions to the build script
                sh 'sudo chmod +x build.sh'
                sh 'sudo chmod +x deploy.sh'

                // Build the Docker image using the build script
                sh './deploy.sh'

              
            }
        }
    }
}
