#! /bin/bash
tar xf abinit-8.6.1.tar.gz
mkdir build
singularity exec -B $(pwd):/mnt /public/singularity/images/centos-7.4-2017/intelmpi-devel.img  /mnt/install.sh
singularity build /public/singularity/images/centos-7.4-2017/abinit-8.6.1.img abinit-8.6.1-intelmpi.def
rm -rf abinit-8.6.1 build
