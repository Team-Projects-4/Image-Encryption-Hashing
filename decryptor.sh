#!/bin/sh

# Defines image directories.
enc_image_dir="/pathToEncryptedImages/enc_image_dir"
dec_image_dir="/pathToDecryptedImages/dec_image_dir"

# Creates output_dir if it doesn't exist. 
if [ ! -d "$dec_image_dir" ]; then       
        mkdir -p "$dec_image_dir"
fi 

# Decrypts every image inside of enc_image_dir.
for image in "$enc_image_dir"/*; do
        if [ -f "$image" ]; then
        # Encrypts every image with openssl aes and saves the output to output_dir
                openssl enc -aes-256-cbc -pass pass:group4 -d -in "$image" -out "$dec_image_dir/$(basename "$image").png" -P
        fi
done 
