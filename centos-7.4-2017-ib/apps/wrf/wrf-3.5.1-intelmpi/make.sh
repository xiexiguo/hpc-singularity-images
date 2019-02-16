#! /bin/bash
tar xf netcdf-3.6.3.tar.gz
tar xf WRFV3.5.1.TAR.gz
singularity exec -B $(pwd):/mnt /public/singularity/images/centos-7.4-2017/intelmpi-devel.img /mnt/install.sh
singularity build /public/singularity/images/centos-7.4-2017/wrf-3.5.1.img wrf-3.5.1.def
rm -rf netcdf-3.6.3 WRFV3 wrf
