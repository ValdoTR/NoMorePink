#!/bin/bash

# Create output directory if it doesn't exist
mkdir -p output

# Find all files in the input directory and its subdirectories
find ./input -type f | while read file; do
    # Determine the relative path to maintain directory structure
    relative_path="${file#./input/}"
    output_file_dir=$(dirname "output/$relative_path")

    # Ensure the output directory exists
    mkdir -p "$output_file_dir"

    echo "Processing $file file.."
    convert "$file" -transparent "#ff00ff" "$output_file_dir/$(basename "$file")"
done

echo -e "\033[92mNo more pink!\033[0m"