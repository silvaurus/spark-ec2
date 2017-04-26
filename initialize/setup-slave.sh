#!/bin/bash

/root/spark-ec2/copy-dir /root/initialize

cd /root/
git clone https://github.com/intel-hadoop/HiBench.git

wget http://apache.mirrors.lucidnetworks.net/maven/maven-3/3.5.0/binaries/apache-maven-3.5.0-bin.tar.gz

tar xzvf apache-maven*.gz > /tmp/mvn_install.log
rm apache-maven*.gz

export PATH='~/apache-maven-3.5.0/bin':$PATH
cd /root/HiBench/
mvn -Psparkbench -Dspark=2.1 -Dscala=2.11 clean package
