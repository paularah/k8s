#!/bin/bash

# Set the path to the target directory
target_dir="/home/arah/learning/k8s"

# Remove the existing README.md if it exists
rm -f "${target_dir}/README.md"

# Create a new README.md file with the initial heading
echo "# My Kubernetes Learning Notes" > "${target_dir}/README.md"

# Function to check if a folder has images
has_images() {
  local folder="$1"
  if [ -n "$(find "${folder}" -maxdepth 1 -type f \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.gif' -o -iname '*.bmp' -o -iname '*.svg' -o -iname '*.webp' \))" ]; then
    return 0
  else
    return 1
  fi
}

# Function to append images to README.md
append_images() {
  local folder="$1"
  for image in "${folder}"/*.png "${folder}"/*.jpg "${folder}"/*.jpeg "${folder}"/*.gif "${folder}"/*.bmp "${folder}"/*.svg "${folder}"/*.webp; do
    echo "![Image](${image})" >> "${target_dir}/README.md"
  done
}

# Iterate through subdirectories of the target directory
for dir in "${target_dir}"/*/; do
  dir_name=$(basename "$dir")  # Get the folder name
  if [ -f "${dir}/Notes.md" ]; then
    echo "## $dir_name" >> "${target_dir}/README.md"
    if has_images "$dir"; then
      append_images "$dir"
    fi
    # Append the content from the Notes.md file to README.md
    cat "${dir}/Notes.md" >> "${target_dir}/README.md"
    echo -e "\n" >> "${target_dir}/README.md"  # Add a newline for separation
  fi
done
