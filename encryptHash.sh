#/!bin/sh

# This is the primary script used on the transmission side to encrypt and hash the images before being sent.

# Defines image directories.
image_dir="image_dir/" # Specifies where Death Star images are.
enc_image_dir="enc_image_dir/" # Specifies where to save encrypted images.
hash_dir="hashed_image_dir/" # Directory for saved hashes.

# Creates enc_image_dir if it doesn't exist.
mkdir -p "$enc_image_dir"
# Creates hash_dir if it doesn't exist.
mkdir -p "$hash_dir"

# Encrypts every image inside of the image_dir directory.
for image in "$image_dir"/*; do
        if [ -f "$image" ]; then

                # Creates the naming standard for the encrypted images.
                filename=$(basename "$image")
                new_filename="${filename%.*}"
                encrypted_image="enc_image_dir/$new_filename.enc"
                # Encrypts every image with openssl aes and saves the output to enc_image_dir
                openssl enc -aes-256-cbc -k group4 -p -in "$image" -out "$encrypted_image"
                
                # Hash each encrypted image
                hashname=$(basename "$image")
                md5sum "$encrypted_image" > "hash_dir/$hashname.txt"

                # Grab the first 32 characters from the hash.
                hash="${hashname: 32}"

                # Append the hash to the encrypted image.
                $hash >> $encrypted_image
          
        fi
done
