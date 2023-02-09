#!/bin/bash

echo "This demo is intended for distribution to Antimatter partners. Please enter your partner code:"
read -p "code> " PARTNERCODE

echo ${PARTNERCODE} | gpg --output assets/sshkey --passphrase-fd 0 -d assets/sshkey.aes
if [ $? -ne 0 ]
then
  echo "Failed to decrypt. Incorrect partner code?"
  exit 1
fi


ssh -i assets/sshkey demo@34.70.162.127