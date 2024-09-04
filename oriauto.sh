#!/bin/bash

# Define the base directory where the projects will be created
base_dir="projects"

# List of project names
projects=("facebook" "google/oriserve" "meta/oriserve" "oracle")

# Creating the base directory
mkdir -p "$base_dir"

# Loop through each project
for project in "${projects[@]}"; do
  # Creating the project directory
  mkdir -p "$base_dir/$project"
  
  # Check if the directory is named 'oriserve'
  if [[ "$project" == *"oriserve"* ]]; then
    # Create a file named oriserve.txt inside the oriserve directory
    touch "$base_dir/$project/oriserve.txt"
  fi
done

echo "Directories and files created successfully."
