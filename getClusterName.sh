#!/bin/bash

source ../credVariableSetting.sh
./spark-ec2 --region=us-west-2 --zone=us-west-2a -i ../yiizy.pem -k yiizy get-master yiizy16
