#!/bin/bash

source ../credVariableSetting.sh
./spark-ec2 --region=us-east-1 --zone=us-east-1a -i ../yiizyEast.pem -k yiizyEast destroy yiizyEast
