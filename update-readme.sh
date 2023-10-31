#!/bin/bash

# Remove the existing README.md if it exists
rm -f README.md

# Create a new README.md file
echo "#Kubernetes Learning Notes" > README.md
echo "These notes probably contain a lot of typo. I just add notes from studying here and I don't bother to edit them." > README.md


# Function to check if a folder has images
has_images() {
  local folder="$1"
  if [ -n "$(find "${folder}" -maxdepth 1 -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.gif" -o -iname "*.bmp" -o -iname "*.svg" -o -iname "*.webp" \))" ]; then
    return 0
  else
    return 1
  fi
}

# appends images to README.md
append_images() {
  local folder="$1"
  for image in "${folder}"/*.{png,jpg,jpeg,gif,bmp,svg,webp}; do
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
    # Append the content from the notes.md file to README.md
    cat "${dir}/notes.md" >> README.md
    echo -e "\n" >> README.md  # Add a newline for separation
  fi
done
