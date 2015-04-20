#/bin/bash

export REGION=ap-northeast-1
export AWS_DEFAULT_REGION=ap-northeast-1

FROM_DATETIME="2015-04-18T10:00:00Z"
TO_DATETIME="2015-04-18T15:00:00Z"
RDS_INSTANCE="myrds1"
RDS_INSTANCE_READ="${RDS_INSTANCE}-read"

function get_metrics() {
  #$1 - metrics name
  #$2 - Instance name
  #$3 - From datetime
  #$4 - To datetime

aws cloudwatch \
get-metric-statistics \
--namespace AWS/RDS \
--metric-name $1 \
--dimensions Name=DBInstanceIdentifier,Value=$2 \
--start-time $3 \
--end-time $4 \
--period 60 --statistics "Maximum" \
--output text |sort -k 3 > $1_$2.log

}


for metrics_name in CPUUtilization ReadIOPS WriteIOPS DatabaseConnections ReplicaLag FreeableMemory NetworkReceiveThroughput NetworkTransmitThroughput FreeStorageSpace BinLogDiskUsage
do
  get_metrics ${metrics_name} ${RDS_INSTANCE} ${FROM_DATETIME} ${TO_DATETIME}
  get_metrics ${metrics_name} ${RDS_INSTANCE_READ} ${FROM_DATETIME} ${TO_DATETIME}
done


