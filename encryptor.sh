#!/bin/sh

# Defines image directories.
image_dir="image_dir/" # Specifies where Death Star images are.
enc_image_dir="enc_image_dir/" # Specifies where to save encrypted images.

# Creates enc_image_dir if it doesn't exist.
if [ ! -d "$enc_image_dir" ]; then
        mkdir -p "$enc_image_dir"
fi

# Encrypts every image inside of the image_dir directory.
for image in "$image_dir"/*; do
        if [ -f "$image" ]; then

                filename=$(basename "$image")
                new_filename="${filename%.*}"
                encrypted_image="enc_image_dir/$new_filename.enc"
        # Encrypts every image with openssl aes and saves the output to enc_image_dir
                openssl enc -aes-256-cbc -k group4 -p -in "$image" -out "$encrypted_image"
        fi
done
