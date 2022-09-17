
# NextCypher multipass generator scripts

## List of Scripts

* check-all.sh: Extract ciphertext from JPG and validate against original
* decrypt-jpg.sh: Extract ciphertext from the specified JPG
* encrypt-all.sh: Store ciphertext inside JPGs
* extract-all.sh: Extract all ciphertexts from all JPGs
* gen-sums.sh: Checksum all JSON data
* gen-txt.c: Generate random data for NFTs
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
$ ./check-all.sh	# validate data stored in each NFT image
```
