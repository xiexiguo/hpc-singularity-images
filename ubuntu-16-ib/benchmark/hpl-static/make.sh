#! /bin/bash
tar xf hpl-2.2.tar.gz
cp Make.intel hpl-2.2
singularity exec -e -B $(pwd):/mnt /public/singularity/images/ubuntu/intelmpi-devel.img  /mnt/install.sh
cp hpl-2.2/bin/intel/xhpl .
cp hpl-2.2/bin/intel/HPL.dat .
rm -rf hpl-2.2
singularity build /public/singularity/images/ubuntu/hpl-2.2.img hpl-2.2-intelmpi.def
rm HPL.dat xhpl
