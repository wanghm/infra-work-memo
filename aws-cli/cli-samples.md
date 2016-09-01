
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

