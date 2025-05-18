#!/bin/bash

# Variables
DOCKER_USERNAME="vaheeth"
REPO_NAME="react-ap"
IMAGE_NAME="${DOCKER_USERNAME}/${REPO_NAME}"
DEV_TAG="dev"
PROD_TAG="prod"

# Step 1: Build the image
echo "Building Docker image..."
docker build -t ${IMAGE_NAME}:${DEV_TAG} .

# Step 2: Tag for production
echo "Tagging image for production..."
docker tag ${IMAGE_NAME}:${DEV_TAG} ${IMAGE_NAME}:${PROD_TAG}

# Step 3: Push both tags to Docker Hub
echo "Pushing dev tag..."
docker push ${IMAGE_NAME}:${DEV_TAG}
echo "Pushing prod tag..."
docker push ${IMAGE_NAME}:${PROD_TAG}

echo "Done!"