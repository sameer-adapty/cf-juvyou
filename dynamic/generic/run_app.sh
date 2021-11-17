##
## Proc file : web: ./run_app.sh
##

#!/bin/bash
portnumber=$(/opt/elasticbeanstalk/bin/get-config environment -k PORT)
AWS_REGION=$(curl --silent http://169.254.169.254/latest/dynamic/instance-identity/document | jq -r .region)
export DATABASE_NAME=$(aws ssm get-parameter \
      --name /appsetup/${portnumber}/db_name \
      --with-decryption --output text \
      --query Parameter.Value --region $AWS_REGION)

echo $DATABASE_NAME

# The code to run the app will be here.
# sample below:
# exec java -jar -Xms2g -Xmx2g .. .. .. .. ..
