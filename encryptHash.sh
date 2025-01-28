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

# Creates hash_dir if it doesn't exist.
if [ ! -d "$hashed_image_dir" ]; then
        mkdir -p "$hashed_image_dir"
fi

# Encrypts every image inside of the image_dir directory.
for image in "$image_dir"/*; do
        if [ -f "$image" ]; then

                # Creates the naming standard for the encrypted images.
                filename=$(basename "$image")
                new_filename="${filename%.*}"
                encrypted_image="enc_image_dir/$new_filename.enc"
                # Encrypts every image with openssl aes and saves the output to enc_image_dir
                openssl enc -aes-256-cbc -k group4 -p -in "$image" -out "$encrypted_image"
        fi
done

# Hashes every image in enc_image_dir and saves it to hashed_image_dir
for image in "$enc_image_dir"/*; do
        if [ -f "$image" ]; then
               hashname=$(basename "$image")
               new_hashname="${hashname%.*}"
               md5sum "$image" > "hashed_image_dir/$new_hashname.txt"
        fi
done
