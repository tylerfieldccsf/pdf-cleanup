#!/bin/bash

# Check if the input file containing the list of files is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <file_list>"
    exit 1
fi

# Input file containing the list of files
file_list="$1"

# Output directory where the processed files will be saved
# output_dir=$(basename "$1" .txt)
output_dir="output/"

# Create the output directory if it doesn't exist
mkdir -p $output_dir
mkdir -p temp/


# Loop through each line in the input file (file paths)
while IFS= read -r file; do
    # Check if the file exists
    if [ -f "$file" ]; then
        echo "Starting $file"

        # Extract the filename from the full path
        filename=$(basename "$file")

        # Define the output file path
        output_file="$output_dir/$filename"

        # remove old temporary jpg files
        rm temp/*.jpg

        # extract each page of the pdf as a jpg and do some operations on the image to clean up the scan
        convert -density 150 $file -normalize -threshold 90% -blur 5 temp/$filename-%03d.jpg

        # use tesseract to do OCR on the images
        ls temp/$filename-*.jpg | tesseract - $output_file -l eng txt quiet

        echo "Processed: $file -> $output_file"
    else
        echo "File not found: $file"
    fi
done < "$file_list"

echo "Processing complete."
