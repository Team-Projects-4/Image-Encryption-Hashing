#!/bin/sh

# Defines image directories.
image_dir="/pathToDeathStarImages/image_dir" # Specifies where Death Star images are. 
enc_image_dir="/pathToEncrytpedImages/enc_image_dir" # Specifies where to save encrypted images. 

# Creates output_dir if it doesn't exist. 
if [ ! -d "$enc_image_dir" ]; then       
        mkdir -p "$enc_imgae_dir"
fi 

# Encrypts every image inside of the image_dir directory. 
for image in "$image_dir"/*; do
        if [ -f "$image" ]; then
        # Encrypts every image with openssl aes and saves the output to output_dir
                openssl enc -aes-256-cbc -pass pass:group4 -p -in "$image" -out "$enc_image_dir/$(basename "$image").enc"
        fi
done 
