#!/bin/bash

# docker volume rm vol-nginx-conf-data
# docker compose up -d

DIRECTORY=certs
if [ -d "$DIRECTORY" ]; then
  echo "$DIRECTORY does exist."
else
  mkdir "$DIRECTORY"
fi

FILE="$DIRECTORY"/amrita-local.net.crt
if [ ! -f "$FILE" ]; then
    openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 \
      -nodes -keyout "$DIRECTORY"/amrita-local.net.key -out "$DIRECTORY"/amrita-local.net.crt -subj "/C=US/ST=TX/L=Frisco/O=Amrita/OU=Tech/CN=amrita-local.net" \
      -addext "subjectAltName=DNS:amrita-local.net,DNS:*.amrita-local.net,IP:10.0.0.1"
fi

FILE="$DIRECTORY"/amrita-local.io.crt
if [ ! -f "$FILE" ]; then
    openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 \
      -nodes -keyout "$DIRECTORY"/amrita-local.io.key -out "$DIRECTORY"/amrita-local.io.crt -subj "/C=US/ST=TX/L=Frisco/O=Amrita/OU=Tech/CN=amrita-local.io" \
      -addext "subjectAltName=DNS:amrita-local.io,DNS:*.amrita-local.io,IP:10.0.0.1"
fi









