#/!bin/sh

# Defines image directories.
enc_image_dir="enc_image_dir/" # Directory for encrypted DeathStar images.
hashed_image_dir="hashed_image_dir/" # Directory for saved hashes.

# Creates hashed_image_dir if it doesn't exist.
if [ ! -d "$hashed_image_dir" ]; then
        mkdir -p "$hashed_image_dir"
fi

# Hashes every image in enc_image_dir and saves it to hashed_image_dir
for image in "$enc_image_dir"/*; do
        if [ -f "$image" ]; then
               hashname=$(basename "$image")
               new_hashname="${hashname%.*}"
               md5sum "$image" > "hashed_image_dir/$new_hashname.txt"
        fi
done
