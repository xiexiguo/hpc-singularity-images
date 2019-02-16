#! /bin/bash
tar xf qe-6.2.tar.gz
singularity exec -B $(pwd):/mnt /public/singularity/images/centos-7.4-2017/intelmpi-devel.img /mnt/install.sh
singularity build /public/singularity/images/centos-7.4-2017/qe-6.2.img qe-6.2.def
rm -rf qe-6.2 build
