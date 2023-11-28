#!/bin/bash

# fail on any error
set -eu

# build image 
echo "Building the image"
docker build -t $AWS_ACCOUNT.dkr.ecr.us-east-1.amazonaws.com/spacex-flask:latest ../.

echo "Loging to ecr"
# login to ecr
aws ecr get-login-password | docker login --username AWS --password-stdin $AWS_ACCOUNT.dkr.ecr.us-east-1.amazonaws.com

echo "pushing to ecr"
# push docker image to ecr repository 
docker push $AWS_ACCOUNT.dkr.ecr.us-east-1.amazonaws.com/spacex-flask:latest