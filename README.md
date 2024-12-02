# Image-Encryption-Hashing
Openssl code for encrypting and hashing images

1. Encrypt the images.
2. Hash the images.
3. Send each image by itself.
4. Verify each image hash.
5. If hash doesn't match redo transmission.
6. If hash does match send next image.
7. Decrypt all encrypted images.

[encryptor.sh](https://github.com/Team-Projects-4/Image-Encryption/blob/main/encryptor.sh) is used for inital encryption before transmission.

[hashor.sh](https://github.com/Team-Projects-4/Image-Encryption-Hashing/blob/main/hashor.sh) is used for inital hashing before transmission.

[hash_verifier](https://github.com/Team-Projects-4/Image-Encryption-Hashing/blob/main/hash_verifier.sh) is used for hash verification/ indication of a successful transmission.

[decryptor.sh](https://github.com/Team-Projects-4/Image-Encryption/blob/main/decryptor.sh) is used for decryption after successful transmission.
