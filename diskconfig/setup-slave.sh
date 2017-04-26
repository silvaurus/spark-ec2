#!/bin/bash

/root/spark-ec2/copy-dir /root/diskconfig
echo "Move diskconfig disks"

echo "Setting up slaves"
mkfs.ext4 /dev/sds
mkdir /disk1
mount /dev/sds /disk1
echo "Setting up slaves done"

