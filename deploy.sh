#!/bin/bash

# Print the value of GIT_BRANCH
echo "GIT_BRANCH: $GIT_BRANCH"

# Check the Git branch
if [[ $GIT_BRANCH == "origin/dev" ]]; then
    # Build your project
    ./build.sh

    # Log in to Docker Hub (replace with your actual Docker Hub credentials)
    docker login -u sedhussr -p dckr_pat_qKEqDaqK7TBBQHnXfcgVaaRdQ-M

    # Tag the image
    docker tag react-appimg sedhussr/dev

    # Push the image to the Dev Docker Hub repository
    docker push sedhussr/dev

elif [[ $GIT_BRANCH == "origin/main" ]]; then
    # Build your project
    ./build.sh

    # Log in to Docker Hub (replace with your actual Docker Hub credentials)
    docker login -u sedhussr -p dckr_pat_qKEqDaqK7TBBQHnXfcgVaaRdQ-M

    # Tag the image
    docker tag react-appimg sedhussr/prod 

    # Push the image to the Prod Docker Hub repository
    docker push sedhussr/prod

else
    echo "Deployment error: Unsupported branch - $GIT_BRANCH"
fi

