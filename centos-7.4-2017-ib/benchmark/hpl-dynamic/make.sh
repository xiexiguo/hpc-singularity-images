#! /bin/bash
tar xf hpl-2.2.tar.gz
cp Make.intel hpl-2.2
singularity exec -B $(pwd):/mnt /public/singularity/images/centos-7.4-2017/intelmpi-devel.img  /mnt/install.sh
cp hpl-2.2/bin/intel/xhpl .
cp hpl-2.2/bin/intel/HPL.dat .
rm -rf hpl-2.2
singularity build /public/singularity/images/centos-7.4-2017/hpl-2.2-dynamic.img hpl-2.2-intelmpi.def
rm HPL.dat xhpl
