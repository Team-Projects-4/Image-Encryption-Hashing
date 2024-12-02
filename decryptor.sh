#!/bin/sh

# Defines image directories.
enc_image_dir="enc_image_dir/"
dec_image_dir="dec_image_dir/"

# Creates dec_image_dir if it doesn't exist.
if [ ! -d "$dec_image_dir" ]; then
        mkdir -p "$dec_image_dir"
fi

# Decrypts every image inside of enc_image_dir.
for image in "$enc_image_dir"/*; do
        if [ -f "$image" ]; then

                filename=$(basename "$image")
                new_filename="${filename%.*}"
                decrypted_image="dec_image_dir/dec_$new_filename.png"
        # Decrypts every image and saves the output to dec_image_dir
                openssl enc -aes-256-cbc -pass pass:group4 -d -in "$image" -out "$decrypted_image" -P
        fi
done
