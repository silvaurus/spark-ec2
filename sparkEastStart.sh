#!/bin/bash

source ../credVariableSetting.sh

./spark-ec2 --region=us-east-1 --zone=us-east-1a --instance-type=m4.large --spark-version=2.1.0 -k yiizyEast -i ../yiizyEast.pem -s 1 launch yiizyEast
