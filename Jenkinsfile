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
                    echo "1 $GIT_BRANCH"
                    echo "2 $CURRENT_BRANCH"
                    echo "3 $BRANCH_NAME"
                    echo "4 $CHANGE_BRANCH"
                    echo "5 ${GIT_BRANCH}"
                    echo "6 ${CURRENT_BRANCH}"
                    echo "7 ${BRANCH_NAME}"
                    echo "8 ${CHANGE_BRANCH}"
                    echo "9 ${env.GIT_BRANCH}"
                    echo "10 ${env.CURRENT_BRANCH}"
                    echo "11 ${env.BRANCH_NAME}"
                    echo "12 ${env.CHANGE_BRANCH}"
                //sh 'sudo -u jenkins sudo chmod +x build.sh'
                //sh 'sudo -u jenkins sudo chmod +x deploy.sh'

                // Build the Docker image using the build script
                //sh 'sudo -u jenkins sudo ./deploy.sh'
                }

              
            }
        }
    }
}
