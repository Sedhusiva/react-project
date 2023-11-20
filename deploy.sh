#!/bin/bash

# Check the Git branch
if [[ $GIT_BRANCH == "origin/dev" ]]; then
    # Build your project
    ./build.sh

    # Tag the image
    docker tag react-appimg sedhussr/dev

    # Push the image to the Dev Docker Hub repository
    docker push sedhussr/dev

elif [[ $GIT_BRANCH == "origin/main" ]]; then
    # Build your project
    ./build.sh

    # Tag the image
    docker tag react-appimg sedhussr/prod 

    # Push the image to the Prod Docker Hub repository
    docker push sedhussr/prod
else
    echo "Deployment error"
fi
