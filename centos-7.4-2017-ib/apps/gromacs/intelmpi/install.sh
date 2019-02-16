#! /bin/bash
yum install -y which
yum clean all
cd /mnt/fftw-3.3.4
NP=$(grep processor /proc/cpuinfo | wc -l )
./configure --prefix=/opt/gromacs-5.1.3/fftw-3.3.4 --enable-float --enable-shared --enable-sse2  CC=icc CXX=icpc FC=ifort F77=ifort  && \
make -j $NP && make install && \
cd /mnt/gromacs-5.1.3/build
cmake .. -DCMAKE_INSTALL_PREFIX=/opt/gromacs-5.1.3 -DGMX_MPI=ON  -DCMAKE_C_COMPILER=$(which mpiicc) \
         -DCMAKE_CXX_COMPILER=$(which mpiicpc)  -DFFTWF_INCLUDE_DIR=/opt/gromacs-5.1.3/fftw-3.3.4/include \
         -DFFTWF_LIBRARY=/opt/gromacs-5.1.3/fftw-3.3.4/lib/libfftw3f.so -DGMX_FLOAT=on && \
make -j $NP && make install 
mkdir -p /mnt/build
cp -r /opt/gromacs-5.1.3 /mnt/build
