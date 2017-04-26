#!/bin/bash

pushd /root/spark-ec2/diskconfig > /dev/null

source ./setup-slave.sh
echo "setup.sh source setup-slaves"

for node in $SLAVES $OTHER_MASTERS; do
  echo $node
  ssh -t -t $SSH_OPTS root@$node "/root/spark-ec2/diskconfig/setup-slave.sh" & sleep 0.3
  echo "For nodes run setup slaves"
done
wait


popd > /dev/null
