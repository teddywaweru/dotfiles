#!/usr/bin/env bash
find . \( -name "$1.*" -o -name "*.srl" \) -type f -delete
cp /usr/lib/ssl/openssl.cnf $1.cnf
python <(
cat << "END"
import sys
from ConfigParser import ConfigParser
from StringIO import StringIO

domain = sys.argv[1]

config = ConfigParser()
config.optionxform = lambda option: option

name = "{}.cnf".format(domain)

with open(name, "rb") as stream:
  config.readfp(StringIO("[top]\n" + stream.read()))

config.set(" v3_ca ", "subjectKeyIdentifier", "hash")
config.set(" v3_ca ", "authorityKeyIdentifier", "keyid:always,issuer")
config.set(" v3_ca ", "basicConstraints", "critical, CA:TRUE, pathlen:3")
config.set(" v3_ca ", "keyUsage", "critical, cRLSign, keyCertSign")
config.set(" v3_ca ", "nsCertType", "sslCA, emailCA")

config.set(" v3_req ", "basicConstraints", "CA:FALSE")
config.set(" v3_req ", "keyUsage", "nonRepudiation, digitalSignature, keyEncipherment")
config.set(" v3_req ", "subjectAltName", "@alt_names")
config.remove_option(" v3_req ", "extendedKeyUsage")

config.add_section(" alt_names ")
config.set(" alt_names ", "DNS.1", domain)
config.set(" alt_names ", "DNS.2", "*.{}".format(domain))

config.set(" req ", "req_extensions", "v3_req")

with open(name, "wb") as stream:
    config.write(stream)
END
) $1
tail -n +2 $1.cnf > $1.cnf.tmp && mv $1.cnf.tmp $1.cnf
echo "$1\n" | openssl genrsa -aes256 -out $1.ca.key 2048
chmod 400 $1.ca.key
openssl req -new -x509 -subj "/CN=$1" -extensions v3_ca -days 3650 -key $1.ca.key -sha256 -out $1.ca.crt -config $1.cnf
openssl genrsa -out $1.key 2048
openssl req -subj "/CN=$1" -extensions v3_req -sha256 -new -key $1.key -out $1.csr
openssl x509 -req -extensions v3_req -days 3650 -sha256 -in $1.csr -CA $1.ca.crt -CAkey $1.ca.key -CAcreateserial -out $1.crt -extfile $1.cnf
openssl x509 -in $1.crt -text -noout
