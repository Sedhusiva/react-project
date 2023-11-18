pipeline {
    agent any
    environment {
        DOCKER_CRED='dockerhub'
    }

    stages {
        
        stage('Build and Push Docker Image') {
                steps {
                withCredentials([usernamePassword(credentialsId: "${DOCKER_CRED}",
                passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')])
                {
                sh 'echo \$DOCKER_PASSWORD | docker login -u \$DOCKER_USERNAME --password-stdin docker.io'
                }
                script {
                    echo "$GIT_BRANCH"
                    echo "$CURRENT_BRANCH"
                    echo "$BRANCH_NAME"
                    echo "$CHANGE_BRANCH"
                    echo "${GIT_BRANCH}"
                    echo "${CURRENT_BRANCH}"
                    echo "${BRANCH_NAME}"
                    echo "${CHANGE_BRANCH}"
                    echo "${env.GIT_BRANCH}"
                    echo "${env.CURRENT_BRANCH}"
                    echo "${env.BRANCH_NAME}"
                    echo "${env.CHANGE_BRANCH}"
                //sh 'sudo -u jenkins sudo chmod +x build.sh'
                //sh 'sudo -u jenkins sudo chmod +x deploy.sh'

                // Build the Docker image using the build script
                //sh 'sudo -u jenkins sudo ./deploy.sh'
                }

              
            }
        }
    }
}
