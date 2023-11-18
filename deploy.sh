#!/bin/bash

CURRENT_BRANCH=${GIT_BRANCH}

if [ "$CURRENT_BRANCH" == "origin/main" ]; then
    # Build your project
    echo "building for main"
    . sudo ./build.sh

    # Tag the image
    sudo docker tag react-appimg sedhussr/prod

    # Push the image to the Dev Docker Hub repository
    sudo docker push sedhussr/prod
elif [ "$CURRENT_BRANCH" == "origin/dev" ]; then
    # Build your project
    echo "building for dev"
    . sudo ./build.sh
   
    # Tag the image
    sudo docker tag react-appimg sedhussr/dev 

    # Push the image to the Prod Docker Hub repository
    sudo docker push sedhussr/dev
else
    echo "No action for branch"
fi
