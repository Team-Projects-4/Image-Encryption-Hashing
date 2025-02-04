## Image-Encryption-Hashing
Shell code for encrypting and hashing images

1. Encrypt the images.
2. Hash the images.
3. Send image data along with 32 character hash appened to the end.
4. Verify each image hash.
5. If hash doesn't match retransmit, if hash matches tranmission worked.
6. Decrypt all encrypted images.

# Scripts

Scripts must be ran with sudo ./"scriptname".sh

Require chmod 770

[encryptHash.sh](https://github.com/Team-Projects-4/Image-Encryption-Hashing/blob/main/encryptHash.sh) Used for inital encryption and hashing of the images.

[hashDecrypt.sh](https://github.com/Team-Projects-4/Image-Encryption-Hashing/blob/main/hashDecrypt.sh) Used for hash verification and decryption after the images are transmitted.
