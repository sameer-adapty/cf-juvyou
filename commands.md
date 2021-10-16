
## Some useful commands.
awsc s3 cp "s3://profile-pictures-dev1/sanju-ACPCE - Copy4.jpeg" s.jpeg
awsc s3 ls --region us-east-2

awsc s3api get-object --bucket profile-pictures-dev1  --key "sample.txt" "sam.txt"
awsc s3api put-object --bucket profile-pictures-dev1  --key sample.txt --body sample.txt

## mongo test
    1  sudo apt install mongosh
    2  wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
    3  sudo apt-get install gnupg
    4  wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
    5  echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list
    6  sudo apt-get update
    7  mongosh
    8  sudo apt install mongodb-mongosh
    9  mongosh "mongodb+srv://devm10.gqnaw.mongodb.net/test" --username dbadmin
