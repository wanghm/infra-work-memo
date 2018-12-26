
### get IPs by ASG name

```
#/bin/bash

if [ $# -lt 1 ]; then
#   echo "Example of Usage: sh $(cd $(dirname $0) && pwd)/`basename $0` <elb name>"
   echo "Example of Usage: `basename $0` <elb name>"
   exit 100
fi

ASG_NAME=$1

#ASG_NAME=xxxxxx-asg

aws ec2 describe-instances --filters \
"Name=tag:aws:autoscaling:groupName,Values=$ASG_NAME" \
"Name=instance-state-name,Values=running"  --region ap-northeast-1 | jq '.Reservations[].Instances[].PrivateIpAddress'
```

### get IPs by ELB name

```
ELB_NAME=xxxxxx
INSTANCE_ID=$(aws elb describe-instance-health --load-balancer-name $ELB_NAME --region ap-northeast-1 | jq '.InstanceStates[].InstanceId' | sed 's/\"//g')
aws ec2 describe-instances --instance-ids $INSTANCE_ID --region ap-northeast-1 | jq '.Reservations[].Instances[].PrivateIpAddress'

```

### install jq

```
sudo curl -o /usr/local/bin/jq http://stedolan.github.io/jq/download/linux64/jq && sudo chmod +x /usr/local/bin/jq
```

### get whitelisted IP list from  security group

```
aws ec2 describe-security-groups --group-ids  sg-xxxxxxxx --region us-east-1|jq '.SecurityGroups[].IpPermissions[].IpRanges[].CidrIp'
```

### ELB log format

* timestamp
* elb
* client:port
* backend:port
* request_processing_time
* backend_processing_time
* response_processing_time
* elb_status_code
* backend_status_code
* received_bytes
* sent_bytes
* request

### SES

````
aws ses send-email \
--from aaaaa@xxx.xxx.xxx \
--to bbbbb@bbbbb.com \
--subject "title" \
--text "test-body"  \
--region us-east-1
````

### RDS

get RDS list
```
aws rds describe-db-instances --region=ap-northeast-1 |jq -r '.DBInstances[] |{DBInstanceIdentifier,DBInstanceClass,MultiAZ,AllocatedStorage}|@text "\(.DBInstanceIdentifier)\t\(.DBInstanceClass)\t\(.MultiAZ)\t\(.AllocatedStorage)"'
```
### get launched instance ID by Cloudtrail Event

```
aws cloudtrail lookup-events --lookup-attributes AttributeKey=EventName,AttributeValue=RunInstances --start-time "2018-01-26, 00:00 AM" --end-time "2018-01-26, 12:59 PM"  --region us-east-1 | jq '.Events[].Resources[].ResourceName'|egrep '^"i-'|sort|uniq
```

### get list of running EC2 instances (with instancetype, IPs, tags)

```
aws ec2 describe-instances --region us-west-1 \
--filter "Name=instance-state-name,Values=running" \
--query 'Reservations[].Instances[].{PrivateIp:PrivateIpAddress,InstanceId:InstanceId,InstanceType:InstanceType,Name:Tags[?Key==`Name`].Value,Service:Tags[?Key==`Service`].Value}' \
--output text
```

### get EC2 instance list without required TAG setting

```
aws ec2 describe-instances \
--query 'Reservations[].Instances[?Tags[?Key==`TAG_KEY_NAME`].Value|[0]==null][].{InstanceId:InstanceId,Tags:Tags[?Key==`Name`].Value|[0],InstanceType:InstanceType,State:State.Name,Ip:PrivateIpAddress,AZ:Placement.AvailabilityZone,Platform:Platform}' \
--output text
```
