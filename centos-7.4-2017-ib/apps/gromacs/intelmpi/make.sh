#! /bin/bash
tar xf gromacs-5.1.3.tar.gz
tar xf fftw-3.3.4.tar.gz
mkdir gromacs-5.1.3/build
singularity exec -e -B $(pwd):/mnt /public/singularity/images/centos-7.4-2017/intelmpi-devel.img  /mnt/install.sh
singularity build /public/singularity/images/centos-7.4-2017/gromacs-5.1.3.img gromacs-5.1.3-intelmpi.def
rm -rf fftw-3.3.4 gromacs-5.1.3 build
