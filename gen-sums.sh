#!/bin/sh

sha256sum jsondata/*.json | awk '{print $1}' > SHA256.txt

