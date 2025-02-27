#!/bin/sh
#
# This is the primary script used to verify the hash and decrypt the encrypted images.
# Requires chmod 770

# Defines image and hash directories.
transmission_dir="transmission_dir/"
dec_image_dir="dec_image_dir/"

# Creates the transmission_dir if it doesn't exist.
if [ ! -d "$transmission_dir" ]; then
        mkdir -p "$transmission_dir"
fi

# Creates the dec_image_dir if it doesn't exist.
if [ ! -d "$dec_image_dir" ]; then
        mkdir -p "$dec_image_dir"
fi

for enc_image in "$transmission_dir"/*; do
        if [ -f "$enc_image" ]; then

                filename=$(basename "$enc_image")
                new_filename="${filename%.*}"
                echo "Processing file: $filename"

                # Grab the hash from the transmission.
                hash_from_transmission=$(tail -c 32 "$enc_image")
                echo "Transmitted hash:"$hash_from_transmission

                # Remove the hash from the transmission.
                enc_data=$(head -c -32 "$enc_image")

                # Rehash the transmission.
                computed_hash=$(echo "$enc_data" | md5sum | awk '{print $1}')
                echo "Rehashed transmission:"$computed_hash

                # Compare the two hashes, if the are the same decrypt, if not print error message.
                if [ "$computed_hash" = "$hash_from_transmission" ]; then

                        dec_image="$dec_image_dir/$new_filename.dec"

                        # Decrypt the encrypted image.
                        echo "$enc_data" | openssl enc -d -aes-256-cbc -k group4 -out "$dec_image" -p

                        echo "Transmission successfull for $filename."
                        echo " "
                else

                        # Hashes weren't the same, need to retransmit.
                        echo "Transmission failed for $filename."
                        echo " "
                fi
        fi
done

