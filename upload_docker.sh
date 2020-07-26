#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath=ankit0910/udacityroject

# Step 2:  
# Authenticate & tag
docker logout
docker login --username ankit0910 --password California@15
docker tag capstoneproject1 
echo "Docker ID and Image: $dockerpath"

# Step 3:
# Push image to a docker repository
docker push $dockerpath
