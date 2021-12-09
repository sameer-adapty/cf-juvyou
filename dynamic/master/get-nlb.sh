#!/bin/bash

aws --profile mukta-dev --region eu-west-1 elasticbeanstalk describe-environments > bs.json
aws --profile mukta-dev  --region eu-west-1 elbv2 describe-load-balancers  > lb.json

api_url=$(jq '.Environments[]  | select(.EnvironmentName == "beanstalk-apiserver-varenvname" ) | .EndpointURL ' bs.json)
cfg_url=$(jq '.Environments[]  | select(.EnvironmentName == "beanstalk-configserver-varenvname" ) | .EndpointURL ' bs.json)
ml_url=$(jq '.Environments[]  | select(.EnvironmentName == "beanstalk-mlserver-varenvname" ) | .EndpointURL ' bs.json)
sch_url=$(jq '.Environments[]  | select(.EnvironmentName == "beanstalk-scheduler-varenvname" ) | .EndpointURL ' bs.json)

echo $api_url
echo $cfg_url
echo $ml_url
echo $sch_url

echo ""
echo "URLs:"
echo ""

api_arn=$(jq ".LoadBalancers[]  | select(.DNSName == ${api_url} ) | .LoadBalancerArn" lb.json)
cfg_arn=$(jq ".LoadBalancers[]  | select(.DNSName == ${cfg_url} ) | .LoadBalancerArn" lb.json)
ml_arn=$(jq ".LoadBalancers[]  | select(.DNSName == ${ml_url} ) | .LoadBalancerArn" lb.json)
sch_arn=$(jq ".LoadBalancers[]  | select(.DNSName == ${sch_url} ) | .LoadBalancerArn" lb.json)

echo ""
echo "ARNs:"
echo ""

echo "api=", $api_arn
echo "config=", $cfg_arn
echo "recommendation=", $ml_arn
echo "schedular=", $sch_arn


