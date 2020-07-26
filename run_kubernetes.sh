#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=ankit0910/test

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deployment demo --image=$dockerpath

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl expose deployment demo --type="NodePort" --port=8000
kubectl port-forward deployment/demo 8000:80