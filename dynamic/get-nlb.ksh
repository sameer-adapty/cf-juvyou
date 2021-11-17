awsc --region us-west-2 elasticbeanstalk describe-environments > bs.json
awsc --region us-west-2 elbv2 describe-load-balancers  > lb.json

api_url=$(jq '.Environments[]  | select(.EnvironmentName == "beanstalk-apiserver-dev" ) | .EndpointURL ' bs.json)
cfg_url=$(jq '.Environments[]  | select(.EnvironmentName == "beanstalk-configserver-dev" ) | .EndpointURL ' bs.json)
ml_url=$(jq '.Environments[]  | select(.EnvironmentName == "beanstalk-mlserver-dev" ) | .EndpointURL ' bs.json)

# echo $api_url
# echo $cfg_url
# echo $ml_url

api_arn=$(jq ".LoadBalancers[]  | select(.DNSName == ${api_url} ) | .LoadBalancerArn" lb.json)
cfg_arn=$(jq ".LoadBalancers[]  | select(.DNSName == ${cfg_url} ) | .LoadBalancerArn" lb.json)
ml_arn=$(jq ".LoadBalancers[]  | select(.DNSName == ${ml_url} ) | .LoadBalancerArn" lb.json)

echo $api_arn > api.name
echo $cfg_arn > cfg.name
echo $ml_arn > ml.name




