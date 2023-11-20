#!/bin/bash

# Print debug information
echo "Branch: $GIT_BRANCH"
echo "Commit: $GIT_COMMIT"

# Extract branch name from GIT_BRANCH
BRANCH_NAME=$(echo "$GIT_BRANCH" | awk -F'/' '{print $NF}')
export BRANCH_NAME

# Check the Jenkins environment variable for Git branch
if [[ $BRANCH_NAME == "dev" ]]; then
    # Build and start your project in dev mode
    # Tag the image
    docker tag react-appimg sedhussr/dev

    # Push the image to the Dev Docker Hub repository
    docker push sedhussr/dev

elif [[ $BRANCH_NAME == "main" ]]; then
    # Build and start your project in prod mode
    # Tag the image
    docker tag react-appimg sedhussr/prod 

    # Push the image to the Prod Docker Hub repository
    docker push sedhussr/prod

else
    echo "Deployment error: Unknown branch"
fi
