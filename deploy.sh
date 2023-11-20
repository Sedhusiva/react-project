#!/bin/bash

# Set the Git branch as an environment variable
export GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

# Check the Git branch
if [[ $GIT_BRANCH == "dev" ]]; then
    # Your dev branch logic here
    echo "Building and deploying for dev branch"
     ./build.sh

    # Tag the image
    docker tag react-appimg sedhussr/dev

    # docker login credentials
    docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWD

    # Push the image to the Prod Docker Hub repository
    docker push sedhussr/dev

elif [[ $GIT_BRANCH == "main" ]]; then
    # Your main branch logic here
    echo "Building and deploying for main branch"
     # Build your project
    ./build.sh

    # Tag the image
    docker tag react-appimg sedhussr/prod 

    # docker login credentials
    docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWD

    # Push the image to the Prod Docker Hub repository
    docker push sedhussr/prod

else
    echo "Unsupported branch: $GIT_BRANCH"
    exit 1
fi

