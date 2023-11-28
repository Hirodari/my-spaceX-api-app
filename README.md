# This article shows the steps for the cicd pipeline

- Copy SpaceX API app files
    * app.py
    * static folder
    * templates
    * Dockerfile
    * requirements.txt
- Copy cicd folder
    * configure-name-profile.sh: this script set up aws user profile for authentication
    * k8s-tools-install.sh: this script installs kubectl and eksctl cli for k8s
    * push-to-ecr.sh: this one build and push docker image to ecr repo