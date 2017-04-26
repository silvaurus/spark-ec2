#!/bin/bash
pushd /root/spark-ec2/initialize > /dev/null

source ./setup-slave.sh


for node in $SLAVES $OTHER_MASTERS; do
  echo $node
  ssh -t -t $SSH_OPTS root@$node "/root/spark-ec2/initialize/setup-slave.sh" & sleep 0.3
done
wait


popd > /dev/null

