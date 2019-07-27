#!/bin/bash

REGION=ap-northeast-2


echo "################################################################################"
echo "# EC2 Instances (Generated within 1 day)"

    echo ">> region : ${REGION}"

    aws configure set default.region ${REGION}

    aws ec2 describe-instances --query "Reservations[].Instances[?LaunchTime>='`date +%Y-%m-%d -d 'yesterday'`'][].{id: InstanceId, type: InstanceType, launched: LaunchTime}" --output table

echo "################################################################################"