#/!bin/sh

# Defines image directories.
image_dir="/path/to/image_dir" # Directory for DeathStar images.
hashed_image_dir="path/to/hashed_image_dir" # Directory for saved hashes.

# Creates hashed_image_dir if it doesn't exist.
if [ ! -d "$hashed_image_dir" ]; then       
        mkdir -p "$hashed_image_dir"
fi 

# Hashes every image in image_dir and saves it to hashed_image_dir
for image in "$image_dir/*"; do
        if [ -f "$image" ]; then
               filename=(basename "$image")
               md5sum "$image" > "$hashed_image_dir/$filename.txt"
        fi
done 
