#!/bin/bash

# Print debug information
echo "Branch: $GIT_BRANCH"
echo "Commit: $GIT_COMMIT"

# Extract branch name from GIT_BRANCH
BRANCH_NAME=$(echo "$GIT_BRANCH" | awk -F'/' '{print $NF}')
export BRANCH_NAME

if [ "$BRANCH_NAME" == "origin/main" ]; then

echo "building for main"

. ./build.sh

sudo docker tag react-appimg sedhussr/prod

sudo docker push sedhussr/prod

elif [ "$BRANCH_NAME" == "origin/dev" ]; then

echo "building for dev"
. ./build.sh

sudo docker tag react-appimg sedhussr/dev 

sudo docker push sedhussr/dev

else

echo "No action for branch"

fi
