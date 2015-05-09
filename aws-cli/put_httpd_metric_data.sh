#!/bin/bash

METRICS_NAME="HttpdProcessCount" 
NAME_SPACE="MyService" 
ASG_NAME="xxxxxx-asg" 

while test 1
do
  httpd_process_couont=`ps -ef|grep '/usr/sbin/httpd'|grep apache|wc -l`
  timestamp=`date +%Y-%m-%dT%H:%M:%S.000Z`

  aws cloudwatch put-metric-data \
  --metric-name ${METRICS_NAME} \
  --namespace ${NAME_SPACE} \
  --dimensions "AutoscageGroup=${ASG_NAME}" \
  --value ${httpd_process_couont} \
  --timestamp ${timestamp} \
  --region ap-northeast-1

  sleep 30

done

