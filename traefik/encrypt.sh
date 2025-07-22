sops -e --age $(cat $SOPS_AGE_KEY_FILE |grep -oP "public key: \K(.*)") .env > .env.crypt
sops -e --age $(cat $SOPS_AGE_KEY_FILE |grep -oP "public key: \K(.*)") config/acme.json > config/acme.json.crypt
