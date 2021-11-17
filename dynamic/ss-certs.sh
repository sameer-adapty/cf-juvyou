# this script geerates a local certificate authority. Creates a new client certificate and signs that certificate with CA's cert
# the client cert then can be used to connect to API gateway while truststore should use bundle file created.

# generate the root certificate
openssl req -x509 -sha256 -days 3650 -newkey rsa:4096 -keyout root-ca-dev.key -out root-ca-dev.crt

# generate the client key
openssl req -new -newkey rsa:4096 -keyout client-01.key -out client-01.csr

# sign the client key with local root CA
openssl x509 -req -CA root-ca-dev.crt -CAkey root-ca-dev.key -in client-01.csr -out client-01.crt -days 365 -CAcreateserial

# make a bundle of the files to be used in trust store
cat root-ca-dev.key root-ca-dev.crt > ca-key-bundle.txt 