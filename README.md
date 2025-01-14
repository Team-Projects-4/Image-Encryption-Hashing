## Image-Encryption-Hashing
Shell code for encrypting and hashing images

1. Encrypt the images.
2. Hash the images.
3. Send image data along with 32 character hash appened to the end.
4. Verify each image hash.
5. If hash doesn't match retransmit, if hash matches tranmission worked.
6. Decrypt all encrypted images.

Images will be stored in image_dir.

Encrypted images will be stored in enc_image_dir.

Decrypted images will be stored in dec_image_dir.

Image hashes will be stored in hashed_image_dir.

# Scripts

Scripts must be ran with sudo ./"scriptname".sh

[encryptor.sh](https://github.com/Team-Projects-4/Image-Encryption/blob/main/encryptor.sh) is used for inital encryption before transmission.

[hashor.sh](https://github.com/Team-Projects-4/Image-Encryption-Hashing/blob/main/hashor.sh) is used for inital hashing before transmission.

[hash_verifier](https://github.com/Team-Projects-4/Image-Encryption-Hashing/blob/main/hash_verifier.sh) is used for hash verification/ indication of a successful transmission.

[decryptor.sh](https://github.com/Team-Projects-4/Image-Encryption/blob/main/decryptor.sh) is used for decryption after successful transmission.
