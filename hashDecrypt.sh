#!/bin/sh
#
# This is the primary script used to verify the hash and decrypt the encrypted images.
# Requires chmod 770

# Defines image and hash directories.
transmission_dir="transmission_dir/"
dec_image_dir="dec_image_dir/"
thash_dir="thash_dir/"
rhash_dir="rhash_dir/"

# Sets retransmit to true.
retransmit=true

# Creates the transmission_dir if it doesn't exist.
if [ ! -d "$transmission_dir" ]; then
        mkdir -p "$transmission_dir"
fi

# Creates the dec_image_dir if it doesn't exist.
if [ ! -d "$dec_image_dir" ]; then
        mkdir -p "$dec_image_dir"
fi

# Creates the thash_dir if it doesn't exist.
if [ ! -d "$thash_dir" ]; then
        mkdir -p "$thash_dir"
fi

# Creates the rhash_dir if it doesn't exist.
if [ ! -d "$rhash_dir" ]; then
        mkdir -p "$rhash_dir"
fi

for transmission in "$transmission_dir"/*; do
        if [ -f "$transmission" ]; then

                # Strip the hash from the transmission.
                hashname1=$(basename "$transmission")
                tHash="${hashname1%.*}"
                tail -c 32 $transmission >> thash_dir/$tHash.txt

                # Strip the hash from the transmission.
                truncate -s -32 $transmisson.enc
                
                # Hash the transmission again.
                hashname2=$(basename "$transmission")
                rHash="${hashname2%.*}"
                md5sum $transmission > rhash_dir/$rHash.txt

                # Removes extra non-necessary information from the hash file.
                truncate -s 32 rhash_dir/$rhash.txt

                # Compare the hashes to verify they are the same.
                if [ "$tHash" = "$rHash" ]; then

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
