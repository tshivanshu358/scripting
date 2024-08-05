#########################################
# Author : Shivanshu Tyagi
# Date : Time Travelling
#
# Some usefull commands for generating random data
#
##########################################
#!/bin/bash

set -x
set -e
set -o pipefail

# Number of files to create
num_files=1000

# Size of each file in MB
file_size_mb=10

# Directory to store the files
output_dir="random_images"

mkdir -p $output_dir

for i in $(seq 1 $num_files); do
  dd if=/dev/urandom of=$output_dir/image_$i.jpg bs=1M count=$file_size_mb
done

# Number of files to create
num_files=1000

# Size of each file in MB
file_size_mb=10

# Directory to store the files
output_dir="random_texts"

mkdir -p $output_dir

for i in $(seq 1 $num_files); do
  base64 /dev/urandom | head -c ${file_size_mb}M > $output_dir/text_$i.txt
done

