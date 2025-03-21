
#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <input-file> <output-file>"
  exit 1
fi

input_file=$1
output_file=$2

ffmpeg -i "$input_file" -vn -acodec mp3 "$output_file"

if [ $? -eq 0 ]; then
  echo "Conversion successful: $output_file"
else
  echo "Conversion failed."
fi

