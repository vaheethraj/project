#!/bin/bash

# Variables
DOCKER_USERNAME="vaheeth" # Your Docker Hub username
REPO_NAME="react-app"
TAG="prod"
CONTAINER_NAME="react-app"
PORT=8083

# Full image name
IMAGE_NAME="${DOCKER_USERNAME}/${REPO_NAME}:${TAG}"

echo "Stopping and removing old container (if any)..."
sudo docker stop $CONTAINER_NAME 2>/dev/null || true
sudo docker rm $CONTAINER_NAME 2>/dev/null || true

echo "Pulling latest image: $IMAGE_NAME"
sudo docker pull $IMAGE_NAME

echo "Running new container..."
sudo docker run -d \
  --name $CONTAINER_NAME \
  -p $PORT:80 \
  $IMAGE_NAME

echo "Deployment done! App running at: http://localhost:$PORT"
