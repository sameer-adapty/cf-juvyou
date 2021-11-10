## Installation of Mongodb command line on EC2

Create file /etc/yum.repos.d/mongodb-org-5.0.repo 

and paste below in it.

[mongodb-org-5.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/amazon/2/mongodb-org/5.0/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-5.0.asc


Install the mongosh ( mongo shell)

  sudo yum install -y mongodb-mongosh

## to connect to mongodb

  mongosh "mongodb+srv://devm10.gqnaw.mongodb.net" --username dbadmin


## how to get the node info from the mongodb endpoint. This will also help in checking 
## the connectivity.

nslookup -type=SRV _mongodb._tcp.devm10.gqnaw.mongodb.net

[ec2-user@ip-10-50-32-110 ~]$ nslookup -type=SRV _mongodb._tcp.devm10.gqnaw.mongodb.net
Server:         10.50.0.2
Address:        10.50.0.2#53

Non-authoritative answer:
_mongodb._tcp.devm10.gqnaw.mongodb.net  service = 0 0 27017 devm10-shard-00-01.gqnaw.mongodb.net.
_mongodb._tcp.devm10.gqnaw.mongodb.net  service = 0 0 27017 devm10-shard-00-02.gqnaw.mongodb.net.
_mongodb._tcp.devm10.gqnaw.mongodb.net  service = 0 0 27017 devm10-shard-00-00.gqnaw.mongodb.net.

Authoritative answers can be found from:


## then  if you ping each node it will provide the internet ip addr.

[ec2-user@ip-10-50-32-110 ~]$ nslookup devm10-shard-00-02.gqnaw.mongodb.net
Server:         10.50.0.2
Address:        10.50.0.2#53

Non-authoritative answer:
devm10-shard-00-02.gqnaw.mongodb.net    canonical name = ec2-63-32-249-111.eu-west-1.compute.amazonaws.com.
Name:   ec2-63-32-249-111.eu-west-1.compute.amazonaws.com
## Address: 63.32.249.111

[ec2-user@ip-10-50-32-110 ~]$ clear^C
[ec2-user@ip-10-50-32-110 ~]$ nslookup devm10-shard-00-01.gqnaw.mongodb.net
Server:         10.50.0.2
Address:        10.50.0.2#53

Non-authoritative answer:
devm10-shard-00-01.gqnaw.mongodb.net    canonical name = ec2-54-77-32-55.eu-west-1.compute.amazonaws.com.
Name:   ec2-54-77-32-55.eu-west-1.compute.amazonaws.com
## Address: 54.77.32.55

## the abvoe is done before the 



awsc ec2 create-vpc-endpoint --vpc-id vpc-0b5fdaf3bea1b5266 --region ap-southeast-1 --service-name com.amazonaws.vpce.ap-southeast-1.vpce-svc-0752cbcde80271e50 --vpc-endpoint-type Interface --subnet-ids subnet-0c5aae8bfb47b9a18 subnet-0440c6582ea99867b subnet-07da93c071e0264ba


awsc ec2 create-vpc-endpoint --vpc-id vpc-0b5fdaf3bea1b5266 --region eu-west-1 --service-name com.amazonaws.vpce.eu-west-1.vpce-svc-0982a5003eac02ece --vpc-endpoint-type Interface --subnet-ids subnet-0c5aae8bfb47b9a18 subnet-0440c6582ea99867b subnet-07da93c071e0264ba

 nslookup -type=SRV _mongodb._tcp.devm10-pl-0.gqnaw.mongodb.net


Post peering was done:

[ec2-user@ip-10-50-32-110 ~]$ nslookup -type=SRV _mongodb._tcp.devm10.gqnaw.mongodb.net
Server:         10.50.0.2
Address:        10.50.0.2#53

Non-authoritative answer:
_mongodb._tcp.devm10.gqnaw.mongodb.net  service = 0 0 27017 devm10-shard-00-01.gqnaw.mongodb.net.
_mongodb._tcp.devm10.gqnaw.mongodb.net  service = 0 0 27017 devm10-shard-00-02.gqnaw.mongodb.net.
_mongodb._tcp.devm10.gqnaw.mongodb.net  service = 0 0 27017 devm10-shard-00-00.gqnaw.mongodb.net.

Authoritative answers can be found from:


and the individual nodes are now returning the local ips not internet ip

[ec2-user@ip-10-50-32-110 ~]$ nslookup devm10-shard-00-01.gqnaw.mongodb.net
Server:         10.50.0.2
Address:        10.50.0.2#53

Non-authoritative answer:
devm10-shard-00-01.gqnaw.mongodb.net    canonical name = ec2-54-77-32-55.eu-west-1.compute.amazonaws.com.
Name:   ec2-54-77-32-55.eu-west-1.compute.amazonaws.com
Address: 192.168.248.204

[ec2-user@ip-10-50-32-110 ~]$ nslookup devm10-shard-00-02.gqnaw.mongodb.net
Server:         10.50.0.2
Address:        10.50.0.2#53

Non-authoritative answer:
devm10-shard-00-02.gqnaw.mongodb.net    canonical name = ec2-63-32-249-111.eu-west-1.compute.amazonaws.com.
Name:   ec2-63-32-249-111.eu-west-1.compute.amazonaws.com
Address: 192.168.253.81

