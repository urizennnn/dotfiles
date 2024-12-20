
#!/bin/bash

if [ ***REMOVED***$#***REMOVED*** -ne 2 ]; then
  echo ***REMOVED***Usage: $0 <input-***REMOVED***le> <output-***REMOVED***le>***REMOVED***
  exit 1
***REMOVED***

input_***REMOVED***le=$1
output_***REMOVED***le=$2

ffmpeg -i ***REMOVED***$input_***REMOVED***le***REMOVED*** -vn -acodec mp3 ***REMOVED***$output_***REMOVED***le***REMOVED***

if [ $? -eq 0 ]; then
  echo ***REMOVED***Conversion successful: $output_***REMOVED***le***REMOVED***
***REMOVED***
  echo ***REMOVED***Conversion failed.***REMOVED***
***REMOVED***

