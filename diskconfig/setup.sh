#!/bin/bash

mkfs.ext4 /dev/sds
mkdir /disk1
mount /dev/sds /disk1
