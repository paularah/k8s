#!/bin/bash

# Remove the existing README.md if it exists
rm -f README.md

# Create a new README.md file with the initial heading
echo "# My Kubernetes Learning Notes" > README.md

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
    echo "![Image](${image})" >> README.md
  done
}

# Iterate through subdirectories
for dir in */; do
  dir=${dir%*/}  # Remove trailing slash
  if [ -f "${dir}/notes.md" ]; then
    echo "## $dir" >> README.md
    if has_images "$dir"; then
      append_images "$dir"
    fi
    # Append the content from the Notes.md file to README.md
    cat "${dir}/notes.md" >> README.md
    echo -e "\n" >> README.md  # Add a newline for separation
  fi
done
