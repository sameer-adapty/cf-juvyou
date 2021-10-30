awsc cloudformation create-stack --stack-name s01-dev-profile-access --template-body file://s01-dev-profile-access.yaml  --region us-west-2 --capabilities CAPABILITY_NAMED_IAM
awsc cloudformation create-stack --stack-name s02-dev-S3-bucket --template-body file://s02-dev-S3-bucket.yaml  --region us-west-2 --capabilities CAPABILITY_NAMED_IAM
awsc cloudformation create-stack --stack-name s03-dev-vpc --template-body file://s03-dev-vpc.yaml  --region us-west-2 --capabilities CAPABILITY_NAMED_IAM
awsc cloudformation create-stack --stack-name s04-dev-nat-gateways --template-body file://s04-dev-nat-gateways.yaml  --region us-west-2 --capabilities CAPABILITY_NAMED_IAM
awsc cloudformation create-stack --stack-name s05-dev-bastion-host --template-body file://s05-dev-bastion-host.yaml  --region us-west-2 --capabilities CAPABILITY_NAMED_IAM  --parameters ParameterKey=KeyName,ParameterValue=ec2-us-west-2-01

awsc cloudformation create-stack --stack-name s06-dev-bs-apiserver --template-body file://s06-dev-bs-apiserver.yaml  --region us-west-2 --capabilities CAPABILITY_NAMED_IAM --parameters ParameterKey=KeyName,ParameterValue=ec2-us-west-2-02
awsc cloudformation create-stack --stack-name s07-dev-bs-confserver --template-body file://s07-dev-bs-confserver.yaml  --region us-west-2 --capabilities CAPABILITY_NAMED_IAM --parameters ParameterKey=KeyName,ParameterValue=ec2-us-west-2-02
awsc cloudformation create-stack --stack-name s08-dev-bs-mlserver --template-body file://s08-dev-bs-mlserver.yaml  --region us-west-2 --capabilities CAPABILITY_NAMED_IAM --parameters ParameterKey=KeyName,ParameterValue=ec2-us-west-2-02

awsc cloudformation create-stack --stack-name s09-dev-r53-priv-zone --template-body file://s09-dev-r53-priv-zone.yaml  --region us-west-2 --capabilities CAPABILITY_NAMED_IAM
awsc cloudformation create-stack --stack-name s11-dev-vpclink --template-body file://s11-dev-vpclink.yaml  --region us-west-2 --capabilities CAPABILITY_NAMED_IAM --parameters ParameterKey=NLBArnNumber,ParameterValue=arn:aws:elasticloadbalancing:us-west-2:949501214913:loadbalancer/net/awseb-AWSEB-1C0OCQFCL24F8/5fc4783c6448b1d9

awsc cloudformation create-stack --stack-name s12-dev-apigateway --template-body file://s12-dev-apigateway.yaml  --region us-west-2 --capabilities CAPABILITY_NAMED_IAM


