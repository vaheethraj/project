#!/bin/bash

# --- Configuration ---
DOCKERFILE_PATH="./dockerfile" 
DOCKERHUB_USERNAME="vaheeth"   
REPO_NAME="test"
IMAGE_NAME="react-app"
COMMIT_ID=$(git rev-parse --short HEAD) 
LOCAL_TAG="${IMAGE_NAME}:${COMMIT_ID}" 
DOCKERHUB_TAG="${DOCKERHUB_USERNAME}/${REPO_NAME}:${LOCAL_TAG}"

echo "--- Building Docker Image ---"
echo "Local Image Name: $LOCAL_TAG"
echo "Docker Hub Image Name: $DOCKERHUB_TAG"
echo "Dockerfile Path: $DOCKERFILE_PATH"

# --- Build the Docker image ---
sudo docker build -f "$DOCKERFILE_PATH" -t "$LOCAL_TAG" .
if [ $? -ne 0 ]; then
  echo "Error building Docker image."
  exit 1
fi
echo "Docker image built successfully."

# --- Tag the image for Docker Hub ---
echo "--- Tagging image for Docker Hub ---"
sudo docker tag "$LOCAL_TAG" "$DOCKERHUB_TAG"
if [ $? -ne 0 ]; then
  echo "Error tagging image for Docker Hub."
  exit 1
fi
echo "Docker image tagged for Docker Hub: $DOCKERHUB_TAG"

echo "--- Build Process Finished ---"

exit 0
