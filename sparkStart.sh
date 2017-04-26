#!/bin/bash

source ../credVariableSetting.sh

./spark-ec2 --region=us-west-2 --zone=us-west-2a --instance-type=m4.large --spark-version=2.1.0 -k yiizy -i ../yiizy.pem -s 1 launch yiizy11
