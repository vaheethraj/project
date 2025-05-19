#!/bin/bash

# Variables
DOCKER_USERNAME="vaheeth"
REPO_NAME="dev"
IMAGE_NAME="${DOCKER_USERNAME}/${REPO_NAME}"

# Step 1: Build the image
echo "Building Docker image..."
sudo docker build -t ${IMAGE_NAME}:$COMMIT_ID .

# Step 3: Push both tags to Docker Hub
echo "Pushing dev Image"
sudo docker push ${IMAGE_NAME}:$COMMIT_ID

echo "Done!"
