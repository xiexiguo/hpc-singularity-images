#! /bin/bash
tar xf qe-6.2.tar.gz
singularity exec -B $(pwd):/mnt /public/singularity_images/centos-7.4-2016/mvapich-2.2-devel.img /mnt/install.sh
singularity build /public/singularity_images/centos-7.4-2016/qe-6.2-mvapich.img qe-6.2.def
rm -rf qe-6.2 build
