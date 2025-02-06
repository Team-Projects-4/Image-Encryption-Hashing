#!/bin/sh
#
# This is the primary script used to verify the hash and decrypt the encrypted images.
# Requires chmod 770

# Defines images directories.
transmission_dir="transmission_dir/"
dec_image_dir="dec_image_dir/"
transmission_hash_dir="transsmission_hash_dir/"

# Sets retransmit to true.
retransmit=True

# Creates the transmission_dir if it doesn't exist.
if [ ! -d "$transmission_dir" ]; then
        mkdir -p "$transmission_dir"
fi

# Creates the enc_image_dir if it doesn't exist.
if [ ! -d "$enc_image_dir" ]; then
        mkdir -p "$enc_image_dir"
fi

# Creates the dec_image_dir if it doesn't exist.
if [ ! -d "$dec_image_dir" ]; then
        mkdir -p "$dec_image_dir"
fi

# Creates the transmission_hash_dir if it doesn't exist.
if [ ! -d "$transmission_hash_dir" ]; then
        mkdir -p "$transmission_hash_dir"
fi

for transmission in "$transmission_dir"/*; do
        if [ -f "$transmission" ]; then

                # Strip the hash from the transmission.
                hashname1=$(basename "$transmission")
                tHash="${hashname1%.*}"
                tail -c 32 $transmission >> transmission_hash_dir/$tHash.txt

                # Strip the hash from the transmission.
                truncate -s -32 $transmisson
                
                # Hash the transmission again.
                hashname2=$(basename "$transmission")
                rHash="${hashname2%.*}"
                md5sum $transmission > transmission_hash_dir/$rHash.txt

                # Compare the hashes to verify they are the same.

                if [ "$tHash" == "$rHash" ]; then

                        # If the hashes match retransmit = false.
                        retransmit=false
                        echo "Transmission SUCCESSFUL for $transmission."

                        # Decrypt the image
                        filename=$(basename "$dec_image")
                        new_filename="${filename%.*}"
                        openssl enc -d -aes-256-cbc -k group4 -in "$transmission" -out "dec_image_dir/$new_filename" -p                     

                else
                        # If the hashes don't match retransmit = true.
                        retransmit=true
                        echo "Transmission FAILED for $transmission."
                fi
        fi
done
