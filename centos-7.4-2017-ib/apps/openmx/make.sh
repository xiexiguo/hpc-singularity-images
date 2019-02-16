#! /bin/bash
mkdir build/OpenMX-3.8.3 -p
tar xf openmx3.8.tar.gz
cp makefile openmx3.8/source
cp patch3.8.3.tar.gz openmx3.8/source
pushd openmx3.8/source
tar xf patch3.8.3.tar.gz
popd
singularity exec -B $(pwd):/mnt /public/singularity/images/centos-7.4-2017/intelmpi-devel.img  /mnt/install.sh
singularity build /public/singularity/images/centos-7.4-2017/OpenMX-3.8.3.img OpenMX-3.8.3-intelmpi.def
rm openmx3.8 -rf
