#! /bin/bash
cd /mnt
mkdir build
cd qe-6.2
./configure --prefix=/opt/qe-6.2 --with-scalapack=intel --enable-parallel --enable-openmp --enable-debug --disable-option-checking \
   CC=icc FC=ifort F77=ifort MPICC=mpiicc MPIF90=mpiifort  \
&& make all && make install
cp -r /opt/qe-6.2/ /mnt/build
