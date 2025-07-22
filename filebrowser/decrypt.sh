sops --decrypt --age $(cat $SOPS_AGE_KEY_FILE |grep -oP "public key: \K(.*)") --input-type binary --output-type binary config/database.db.crypt > config/database.db
