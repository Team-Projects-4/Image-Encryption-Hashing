#/!bin/sh

image_dir="image_dir/" # Specifies where Death Star images are.
enc_image_dir="enc_image_dir/" # Specifies where to save encrypted images.

if [ ! -d "$enc_image_dir" ]; then
        mkdir -p "$enc_image_dir"
fi

for image in "$image_dir"/*; do
        if [ -f "$image" ]; then

                # Creates the naming standard for the encrypted images.
                filename=$(basename "$image")
                new_filename="${filename%.*}"
                enc_image="$new_filename.enc"
                # Encrypts every image with openssl aes and saves the output to enc_image_dir
                openssl enc -aes-256-cbc -k group4 -p -in "$image" -out "enc_image_dir/$enc_image"
          fi
done
