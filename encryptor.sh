#!/bin/sh

# Defines image directories.
image_dir="/pathToDeathStarImages" # Specifies where Death Star images are. 
output_dir="/pathToEncrytpedImages" # Specifies where to save encrypted images. 

# Creates output_dir if it doesn't exist. 
if [ ! -d "$output_dir" ]; then       
        mkdir -p "$output_dir"
fi 

# Encrypts every image inside of the image_dir directory. 
for image in "$image_dir"/*; do
        if [ -f "$image" ]; then
        # Encrypts every image with openssl aes and saves the output to output_dir
                openssl enc -aes-256-cbc -pass pass:group4 -p -in "$image" -out "$output_dir/$(basename "$image").enc"
        fi
done 
