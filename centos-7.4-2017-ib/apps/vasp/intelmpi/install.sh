#! /bin/bash
yum install -y rsync && yum clean all
cd /mnt/vasp.5.4.4
make all
