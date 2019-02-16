#! /bin/bash
yum install -y tcsh file
cd /mnt/netcdf-3.6.3
./configure --prefix=/opt/netcdf-3.6.3 CC=icc CXX=icpc FC=ifort F77=ifort && \
make && make install
export NETCDF=/opt/netcdf-3.6.3
export PATH=${NETCDF}/bin:$PATH
export WRFIO_NCD_LARGE_FILE_SUPPORT=1
cd /mnt/WRFV3
./configure <<EOF
24
1
EOF
sed -i 's/mpicc/mpiicc/' configure.wrf
sed -i 's/mpif90/mpiifort/' configure.wrf
sed -i 's/-FR/-FR -cpp/' configure.wrf
sed -i 's/-FI/-FI -ccp/' configure.wrf
./compile em_real
mkdir /mnt/wrf
cp -r main /mnt/wrf
cp -r run  /mnt/wrf
