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
                encrypted_image="enc_image_dir/$filename.enc"
        # Encrypts every image with openssl aes and saves the output to enc_image_dir
                openssl enc -aes-256-cbc -pass pass:group4 -p -in "$image" -out "$encrypted_image"
        fi
done
