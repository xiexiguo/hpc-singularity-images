#! /bin/bash
singularity exec -B $(pwd):/mnt /public/singularity_images/centos-7.4-2016/vasp-5.4.4.img /mnt/copy.sh
singularity build /public/singularity_images/centos-7.4-2016/vasp-5.4.4-mvapich.img vasp-5.4.4-mvapich.def
rm -rf vasp_std vasp_ncl vasp_gam
