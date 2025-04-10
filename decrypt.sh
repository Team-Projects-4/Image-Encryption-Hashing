#/!bin/sh

enc_image_dir="/home/$USER/repos/Image-Encryption-Hashing/enc_image_dir/" # Specifies where to save encrypted images.
dec_image_dir="/home/$USER/repos/Image-Encryption-Hashing/dec_image_dir/" # Specifies where to save decrypted images.
img_output_dir="/home/$USER/repos/Image-Encryption-Hashing/out_image_dir/"
# Creates dec_image_dir if it doesn't exist.
if [ ! -d "$dec_image_dir" ]; then
        mkdir -p "$dec_image_dir"
fi

for image in "$dec_image_dir"/*; do
        if [ -f "image" ]; then

                # Creates the naming standard for the encrypted images.
                filename=$(basename "$image")
                new_filename="${filename%.*}"
                dec_image="$new_filename.enc"
                # Encrypts every image with openssl aes and saves the output to enc_image_dir
                openssl enc -d -aes-256-cbc -k group4 -p -in "$image" -out "$img_output_dir$dec_image" 
        fi
done
