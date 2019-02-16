#! /bin/bash
tar xf netcdf-3.6.3.tar.gz
tar xf WRFV3.5.1.TAR.gz
singularity exec -B $(pwd):/mnt /public/singularity_images/centos-7.4-2016/intelmpi-devel.img /mnt/install.sh
singularity build /public/singularity_images/centos-7.4-2016/wrf-3.5.1.img wrf-3.5.1.def
rm -rf netcdf-3.6.3 WRFV3 wrf
