
# NextCypher multipass generator scripts

Steganography and NFTs

## Introduction

This repository demonstrates how to vary a single JPEG image into multiple
NFT images, by drawing a text label on each image, then encrypting and
inserting a small metadata file into the JPEG using steganography, using
a sequence of steps:

1. **INPUT**: A single JPEG file.
2. **MODIFY**: Add the NFT number to the bottom left & right image corners.
3. **MODIFY**: Add encrypted data using steganography.
4. **OUTPUT**: The modified JPEG files, aka the NFT collection.

## List of Scripts

* check-all.sh: Extract ciphertext from JPG and validate against original
* clean.sh: Remove all generated data files
* decrypt-jpg.sh: Extract ciphertext from the specified JPG
* encrypt-all.sh: Store ciphertext inside JPGs
* extract-all.sh: Extract all ciphertexts from all JPGs
* gen-sums.sh: Checksum all JSON data
* gen-txt.c: Generate random data for NFTs
* generate.sh: Generate all data from a clean repo
* mkseed.c: Generate random seed to be used for gen-txt
* NXC-MultiPass-300dpi.jpg: original input data
* stamp-all.sh: Write NFT number in bottom corners of each JPG

## NFT drop creation steps

```
$ vi get-txt.c		# edit NFT drop loot, if desired
$ gcc -Wall -O -o gen-txt gen-txt.c # recompile gen-txt # recompile
$ ./gen-txt		# generate NFT loot
$ ./stamp-all.sh	# stamp each NFT with a number
$ ./encrypt-all.sh	# store loot into NFT image
$ ./extract-all.sh	# extract data stored in each NFT image
$ ./check-all.sh	# validate extracted data from each NFT image
```
