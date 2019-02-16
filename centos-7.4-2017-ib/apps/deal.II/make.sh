#!/bin/bash
singularity exec -B $(pwd):/mnt /public/singularity/images/centos-7.4-2017/intelmpi-devel.img /mnt/install.sh
singularity build /public/singularity/images/centos-7.4-2017/dealii-gnu-8.4.1.img dealii-gnu.def
rm -rf deal.II
