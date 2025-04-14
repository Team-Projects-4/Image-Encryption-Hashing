#!/usr/bin/env bash
#
# encrypt.sh
# Encrypts all image files in image_dir and places the resulting *.enc files in enc_image_dir.

# Directory containing the original (unencrypted) images
SRC_IMAGE_DIR="/home/$USER/repos/Image-Encryption-Hashing/image_dir/"

# Directory where encrypted files will be saved
ENC_IMAGE_DIR="/home/$USER/repos/Image-Encryption-Hashing/enc_image_dir/"

# Create the encryption output directory if it doesn’t exist
mkdir -p "${ENC_IMAGE_DIR}"

# Loop through every file in SRC_IMAGE_DIR
for image in "${SRC_IMAGE_DIR}"*; do
  # Ensure we’re only handling files
  if [ -f "${image}" ]; then
    # Strip path and extension
    filename="$(basename -- "${image}")"
    base_name="${filename%.*}"

    # Name for the encrypted file
    enc_filename="${base_name}.enc"

    # Encrypt the file with AES-256-CBC
    openssl enc -aes-256-cbc \
      -k group4 \
      -p \
      -in "${image}" \
      -out "${ENC_IMAGE_DIR}${enc_filename}"
  fi
done

echo "Encryption complete. Encrypted files are in: ${ENC_IMAGE_DIR}"
