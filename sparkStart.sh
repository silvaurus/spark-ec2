#!/bin/bash

rm troubleShoot.txt
./spark-ec2 --region=us-west-2 --zone=us-west-2a --instance-type=t2.medium --spark-version=2.1.0 -k yiizy -i ../../yiizy.pem -s 4 launch yiizy
