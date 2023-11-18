#!/bin/bash

# Check the Git branch
if [[ $GIT_BRANCH == "origin/dev" ]]; then
    # Build your project
    ./build.sh

    # Log in to Docker Hub (Docker Hub credentials)
    sudo docker login -u sedhussr -p dckr_pat_qKEqDaqK7TBBQHnXfcgVaaRdQ-M

  
    # Tag the image
    sudo docker tag react-appimg sedhussr/dev

    # Push the image to the Dev Docker Hub repository
    sudo docker push sedhussr/dev

elif [[ $GIT_BRANCH == "origin/main" ]]; then
    # Build your project
    ./build.sh

    # Log in to Docker Hub ( Docker Hub credentials)
    sudo docker login -u sedhussr -p dckr_pat_qKEqDaqK7TBBQHnXfcgVaaRdQ-M

   
    # Tag the image
    sudo docker tag react-appimg sedhussr/prod 

    # Push the image to the Prod Docker Hub repository
    sudo docker push sedhussr/prod
else
    echo "Deployment error"
fi
