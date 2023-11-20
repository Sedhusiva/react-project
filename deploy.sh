#!/bin/bash

# Set the Git branch as an environment variable
export GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

# Check the Git branch
if [[ $GIT_BRANCH == "dev" ]]; then
    # Your dev branch logic here
    echo "Building and deploying for dev branch"
    ./build.sh
    # tag the image
    docker tag react-appimg sedhussr/dev

    # push the image
    docker push sedhussr/dev

elif [[ $GIT_BRANCH == "main" ]]; then
    # Your main branch logic here
    echo "Building and deploying for main branch"

else
    echo "Unsupported branch: $GIT_BRANCH"
    exit 1
fi
