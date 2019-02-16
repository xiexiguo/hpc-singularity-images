#! /bin/bash
tar xf gromacs-5.1.3.tar.gz
tar xf fftw-3.3.4.tar.gz
mkdir gromacs-5.1.3/build
singularity exec -B $(pwd):/mnt /public/singularity_images/centos-7.4-2016/mvapich-2.2-devel.img  /mnt/install.sh
singularity build /public/singularity_images/centos-7.4-2016/gromacs-5.1.3-mvapich.img gromacs-5.1.3-mvapich.def
rm -rf fftw-3.3.4 gromacs-5.1.3 build
