#! /bin/bash
tar xf libint-1.1.4.tar.gz
tar xf libxc-2.2.2.tar.gz
tar xf cp2k-5.1.tar.bz2
mkdir build
singularity exec -B $(pwd):/mnt /public/singularity/images/centos-7.4-2017/intelmpi-devel.img  /mnt/install.sh
singularity build /public/singularity/images/centos-7.4-2017/cp2k-5.1.img cp2k-5.1-intelmpi.def
rm -rf libint-1.1.4 libxc-2.2.2 cp2k-5.1 build
