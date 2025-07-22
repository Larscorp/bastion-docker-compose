sops --decrypt --age $(cat $SOPS_AGE_KEY_FILE |grep -oP "public key: \K(.*)") --input-type dotenv --output-type dotenv .env.crypt > .env
