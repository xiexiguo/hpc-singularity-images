#!/bin/bash
singularity exec -B $(pwd):/mnt /public/singularity/images/centos-7.4-2017/intelmpi-devel.img /mnt/install-intel.sh
singularity build /public/singularity/images/centos-7.4-2017/dealii-intel-8.4.1.img dealii-intel.def
