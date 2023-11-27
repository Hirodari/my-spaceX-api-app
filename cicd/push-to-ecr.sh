#!/bin/bash

# fail on any error
set -eu

# build image 
docker build -t $AWS_ACCOUNT.dkr.ecr.us-east-1.amazonaws.com/spacex-flask:latest .

# login to ecr
aws ecr get-login-password | docker login --username AWS --password-stdin $AWS_ACCOUNT.dkr.ecr.us-east-1.amazonaws.com

# push docker image to ecr repository 
docker push $AWS_ACCOUNT.dkr.ecr.us-east-1.amazonaws.com/fibonacci


# push docker image to ecr repository 
docker push 116429386222.dkr.ecr.us-east-1.amazonaws.com/spacex-flask:latest

docker login --username $DOCKER_USERNAME --password $DOCKER_PASSWORD