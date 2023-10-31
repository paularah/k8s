#!/bin/bash

# Remove the existing README.md if it exists
rm -f README.md

# Create a new README.md file
echo "# Kubernetes Learning Notes" > README.md
echo "These notes probably contain a lot of typos. I just add notes from studying here, and I don't bother to edit them." >> README.md

# Function to check if a folder has images
has_images() {
  local folder="$1"
  if [ -n "$(find "${folder}" -maxdepth 1 -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.gif" -o -iname "*.bmp" -o -iname "*.svg" -o -iname "*.webp" \))" ]; then
    return 0
  else
    return 1
  fi
}

# Function to append images to README.md
append_images() {
  local folder="$1"
  for image in "${folder}"/*.{png,jpg,jpeg,gif,bmp,svg,webp}; do
    echo "![Image](${image})" >> README.md
  done
}

# Function to convert subheadings from ## to ###
convert_subheadings() {
  local input_file="$1"
  local output_file="$2"
  sed 's/## /### /' "$input_file" > "$output_file"
}

# Iterate through subdirectories
for dir in */; do
  dir=${dir%*/}  # Remove trailing slash
  if [ -f "${dir}/notes.md" ]; then
    echo "## $dir" >> README.md
    if has_images "$dir"; then
      append_images "$dir"
    fi
    # Convert subheadings in Notes.md from ## to ###
    convert_subheadings "${dir}/notes.md" "${dir}/temp_notes.md"
    cat "${dir}/temp_notes.md" >> README.md
    rm "${dir}/temp_notes.md"  # Remove the temporary file
    echo -e "\n" >> README.md  # Add a newline for separation
  fi
done
