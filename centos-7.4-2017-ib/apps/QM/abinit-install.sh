#! /bin/bash
cd /mnt
tar xf abinit-8.6.1.tar.gz
cd /mnt/abinit-8.6.1
./configure --prefix=/opt/abinit-8.6.1 --exec-prefix=/opt/abinit-8.6.1 \
                --enable-mpi=yes --enable-mpi-io=yes \
                FC=mpiifort CC=mpiicc CXX=mpiicpc F77=mpiifort MPICC=mpiicc MPIF90=mpiifort \
                --enable-openmp=yes
echo "Compiling abinit..."
make -j `grep processor /proc/cpuinfo | wc -l`  && make install
cp -r /opt/abinit-8.6.1 /mnt/QM
