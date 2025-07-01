#!/bin/bash

# Set Git user config
git config --global user.name "Varshini-Neelakandan"
git config --global user.email "varshinineelakandan80@gmail.com"
git config --global core.autocrlf true

# Exit immediately if a command fails
set -e

# GitHub repo URL
repo_url="https://github.com/Varshini-Neelakandan/Openfabric-Project.git"

# Initialize Git if not already initialized
if [ ! -d ".git" ]; then
  git init
fi

# Add or update remote origin
if git remote | grep origin > /dev/null; then
    git remote set-url origin "$repo_url"
else
    git remote add origin "$repo_url"
fi

# Add all files
git add .

# Check if there's anything new to commit
if git diff --cached --quiet; then
  echo "No changes to commit."
else
  git commit -m "Upload project"
fi

# Set main branch if not already
git branch -M main || true

# Push to GitHub
git push -u origin main
