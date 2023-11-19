#!/bin/bash

CURRENT_BRANCH=${GIT_BRANCH}

if [ "$CURRENT_BRANCH" == "origin/main" ]; then

echo "building for main"

. ./build.sh

sudo docker tag react-appimg sedhussr/prod

sudo docker push sedhussr/prod

elif [ "$CURRENT_BRANCH" == "origin/dev" ]; then

echo "building for dev"
. ./build.sh

sudo docker tag react-appimg sedhussr/dev 

sudo docker push sedhussr/dev

else

echo "No action for branch"

fi
