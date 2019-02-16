#! /bin/bash
singularity exec -B $(pwd):/mnt /public/singularity_images/centos-7.4-2016/wrf-3.5.1.img /mnt/copy.sh
singularity build /public/singularity_images/centos-7.4-2016/wrf-3.5.1-mvapich.img wrf-3.5.1.def
