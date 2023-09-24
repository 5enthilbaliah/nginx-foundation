#!/bin/bash

# docker volume rm vol-nginx-conf-data
# docker compose up -d

FILE=/certs/app.amrita-local.net.crt
if [ ! -f "$FILE" ]; then
    printf Amr1t@N3t > Certs/app.amrita-local.net.txt
    openssl genrsa -des3 -passout file:Certs/app.amrita-local.net.txt -out Certs/app.amrita-local.net.key 2048
    openssl req -key Certs/app.amrita-local.net.key -passin file:Certs/app.amrita-local.net.txt -subj '/CN=amrita-local-app network applications/O=amrita-local/C=US/OU=amrita-private' -addext "subjectAltName = DNS:app.amrita-local.net" -new -out Certs/app.amrita-local.net.csr
    openssl x509 -signkey Certs/app.amrita-local.net.key -in Certs/app.amrita-local.net.csr -passin file:Certs/app.amrita-local.net.txt -req -days 365 -out Certs/app.amrita-local.net.crt

fi

FILE=/certs/api.amrita-local.io.crt
if [ ! -f "$FILE" ]; then
    printf Amr1t@I0 > Certs/api.amrita-local.io.txt
    openssl genrsa -des3 -passout file:Certs/api.amrita-local.io.txt -out Certs/api.amrita-local.io.key 2048
    openssl req -key Certs/api.amrita-local.io.key -passin file:Certs/api.amrita-local.io.txt -subj '/CN=amrita-local-api io/O=amrita-local/C=US/OU=amrita-private-api' -addext "subjectAltName = DNS:api.amrita-local.io" -new -out Certs/api.amrita-local.io.csr
    openssl x509 -signkey Certs/api.amrita-local.io.key -in Certs/api.amrita-local.io.csr -passin file:Certs/api.amrita-local.io.txt -req -days 365 -out Certs/api.amrita-local.io.crt
fi

# openssl genrsa -des3 -out app.amrita-local.net.key 2048



