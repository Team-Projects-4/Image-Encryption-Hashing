#!/bin/sh
image_dir= /pathToDeathStarImages
# Specifies where Death Star images are. 

output_dir= /pathToEncrytpedImages
# Specifies where to save encrypted images. 

if [ ! -d "$output_dir" ]; then       
        mkdir "$output_dir"
fi
# Creates output_dir if it doesn't exist. 

for image in "$image_dir"/; do
        if [ -f "$image" ]; then
                openssl enc -aes-256-cbc -pass pass:group4 -p -in "$image" -out "$image".enc
        fi
done
# Encrypts every image inside of the image_dir directory. 
