#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=ankit0910/udacityroject

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deployment demolocal2 --image=$dockerpath

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl expose deployment demolocal2 --type=LoadBalancer --port=80