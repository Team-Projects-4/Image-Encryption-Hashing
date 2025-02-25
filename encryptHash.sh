#/!bin/sh

# This is the primary script used on the transmission side to encrypt and hash the images before being sent.
# Requires chmod 770
# Defines image directories.
image_dir="image_dir/" # Specifies where Death Star images are.
enc_image_dir="enc_image_dir/" # Specifies where to save encrypted images.
hashed_image_dir="hashed_image_dir/" # Directory for saved hashes.

# Creates enc_image_dir if it doesn't exist.
if [ ! -d "$enc_image_dir" ]; then
        mkdir -p "$enc_image_dir"
fi

# Encrypts every image inside of the image_dir directory.
for image in "$image_dir"/*; do
        if [ -f "$image" ]; then

                # Creates the naming standard for the encrypted images.
                filename=$(basename "$image")
                new_filename="${filename%.*}"
                enc_image="$new_filename.enc"
                # Encrypts every image with openssl aes and saves the output to enc_image_dir
                openssl enc -aes-256-cbc -k group4 -p -in "$image" -out "enc_image_dir/$enc_image"


                # Hashes the recently encrypted image and outputs it to hashed_image_dir.
                hash=$(md5sum "enc_image_dir/$enc_image" | awk '{print $1}')

                echo "$hash" >> "enc_image_dir/$enc_image"

                cp "enc_image_dir/$enc_image" "transmission_dir/$enc_image"


        fi
done
