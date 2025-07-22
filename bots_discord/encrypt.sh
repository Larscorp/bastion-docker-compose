sops -e --age $(cat $SOPS_AGE_KEY_FILE |grep -oP "public key: \K(.*)") .env > .env.crypt
