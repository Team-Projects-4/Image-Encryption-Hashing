#!/bin/sh

# Sets retransmit to automatically be true.
retransmit=true

# Makes the transmission a string and makes the last 32 characters the md5sum_hash.
transmission="entire sent transmission"
md5sum_hash="${transmission: -32}"

# Creates sent_hash.txt out of the sent md5sum.
echo "$md5sum_hash" > sent_hash.txt

# Specifies the encrypted image directory.
enc_image_dir="/path/to/enc_image_dir"

# Hashes the sent encrypted image.
md5sum "$enc_image" > created_hash.txt

sent_hash=$(sed -n '1p' "$sent_hash.txt")  # Get the first line of the sent hash.
created_hash=$(sed -n '1p' "$created_hash.txt")  # Get the first line of the created hash.

# Compare the two hashes.
if [ "$sent_hash" == "$created_hash" ]; then
    retransmit=false # If the hashes are the same then retransmit equals false.
else
    retransmit=true # If the hashes are different then retransmit equals true.
fi

# Echos the status of retransmit.
echo "Retransmit: $retransmit"
