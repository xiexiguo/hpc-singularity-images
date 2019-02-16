#! /bin/bash
CORE_NUMS=$(grep processor /proc/cpuinfo | wc -l )
cd /mnt
echo "Compiling libint-1.1.4..."
cd libint-1.1.4
./configure --prefix=/opt/libint-1.1.4  CC=icc CXX=icpc F77=ifort FC=ifort 
make -j $CORE_NUMS && make install
cd ..

echo  "Compiling libxc-2.2.2..."  
cd libxc-2.2.2
./configure --prefix=/opt/libxc-2.2.2 CC=icc CXX=icpc F77=ifort FC=ifort 
make -j $CORE_NUMS  && make install 
cd ..

echo "Compiling cp2k-5.1..."
cd cp2k-5.1 
sed -i "s%#LIBINTROOT =.*%LIBINTROOT = /opt/libint-1.1.4%g" arch/Linux-x86-64-intel-mic.psmp
sed -i "s%#LIBXCROOT =.*%LIBXCROOT = /opt/libxc-2.2.2%g" arch/Linux-x86-64-intel-mic.psmp
sed -i 's/MKL_STATIC := 1/MKL_STATIC := 0/g' arch/Linux-x86-64-intel-mic.psmp
sed -i 's/openmp/qopenmp/g' arch/Linux-x86-64-intel-mic.psmp
cd makefiles;
info "Compiling CP2K-5.1..."
make -j $CORE_NUMS  ARCH=Linux-x86-64-intel-host VERSION="popt psmp"  || die "cp2k make failed, see $LOG for details.";
cd ..
cp exe/* /opt/cp2k-5.1/ -r
cp -r /opt/cp2k-5.1 /mnt/build
