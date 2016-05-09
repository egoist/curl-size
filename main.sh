#!/bin/bash

getSizeByDownload() {
  echo `curl ${URL} -sL --write-out '%{size_download}' --output /dev/null`
}

humanlizeSize() {
  local SIZE=$1
  local KB=1024
  local MB=$(( KB * 1024 ))
  
  if (( SIZE > MB )); then
    echo "$(( SIZE / MB )) MB"
  elif (( SIZE > KB )); then
    echo "$(( SIZE / KB )) KB"
  else
    echo "$SIZE Bytes"
  fi
}

URL="$1"

if [ -z "$URL" ]; then
  echo "Please provide a valid URL."
  exit 1
fi

# by Content-Length in header
SIZE=`curl -sLI $URL | grep Content-Length | awk '{print $2}'`
SIZE=${SIZE//$'\r'}

# no Content-Length
# by downloading the whole file
if [ -z "$SIZE" ]; then
  echo "Be patient, downloading the file..."
  SIZE=$(getSizeByDownload)
  echo $(humanlizeSize $SIZE)
  exit
fi

echo $(humanlizeSize $SIZE)
