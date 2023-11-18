#!/bin/bash
set -e
# Check the Git branch
if [ "${GIT_BRANCH}" == "origin/dev" ]; then
    # Build your project
    echo "building for dev"
    . sudo ./build.sh

    # Tag the image
    sudo docker tag react-appimg sedhussr/dev

    # Push the image to the Dev Docker Hub repository
    sudo docker push sedhussr/dev

elif [ "${GIT_BRANCH}" == "origin/main" ]; then
    # Build your project
    echo "building for main"
    . sudo ./build.sh
   
    # Tag the image
    sudo docker tag react-appimg sedhussr/prod 

    # Push the image to the Prod Docker Hub repository
    sudo docker push sedhussr/prod
else
    echo "Deployment error"
fi
