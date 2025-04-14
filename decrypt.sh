#!/usr/bin/env bash
#
# decrypt.sh
# Decrypts all *.enc files in dec_image_dir and places the decrypted results in out_image_dir.

# Directory containing the encrypted *.enc files
DEC_IMAGE_DIR="/home/$USER/repos/Image-Encryption-Hashing/dec_image_dir/"

# Directory where decrypted files will be saved
OUT_IMAGE_DIR="/home/$USER/repos/Image-Encryption-Hashing/out_image_dir/"

# Create the decryption output directory if it doesn’t exist
mkdir -p "${OUT_IMAGE_DIR}"

# Loop through all encrypted *.enc files in DEC_IMAGE_DIR
for enc_file in "${DEC_IMAGE_DIR}"*.enc; do
  # Ensure we're only handling files
  if [ -f "${enc_file}" ]; then
    # Strip path and .enc extension
    filename="$(basename -- "${enc_file}")"
    base_name="${filename%.*}"

    # Name for the decrypted file: replaces .enc with .png
    dec_filename="${base_name}.png"

    # Decrypt the file
    openssl enc -d -aes-256-cbc \
      -k group4 \
      -p \
      -in "${enc_file}" \
      -out "${OUT_IMAGE_DIR}${dec_filename}"
  fi
done

echo "Decryption complete. Decrypted files are in: ${OUT_IMAGE_DIR}"
