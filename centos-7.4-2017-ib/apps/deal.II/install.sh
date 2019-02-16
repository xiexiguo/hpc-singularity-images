#!/bin/bash

build_trilinos()
{
    export TRILINOS=/opt/deal.II/Trilinos/11.4.3
    cd /mnt
    if [ -d trilinos-11.4.3-Source ] ; then
        rm -rf trilinos-11.4.3-Source
    fi
    tar xf trilinos-11.4.3-Source.tar.bz2
    cd trilinos-11.4.3-Source
    mkdir build && cd build

    cmake \
    -DTPL_ENABLE_MKL=ON \
    -DTPL_ENABLE_MPI=ON \
    -DTPL_MKL_INCLUDE_DIRS=$MKLROOT/include \
    -DTPL_MKL_LIBRARIES=$MKLROOT/lib/intel64/libmkl_rt.so \
    -DTPL_BLAS_LIBRARIES=$MKLROOT/lib/intel64/libmkl_rt.so \
    -DTPL_LAPACK_LIBRARIES=$MKLROOT/lib/intel64/libmkl_rt.so \
    -DMPI_BASE_DIR=$I_MPI_ROOT/intel64/ \
    -DTrilinos_ENABLE_Amesos=ON \
    -DTrilinos_ENABLE_Epetra=ON \
    -DTrilinos_ENABLE_Ifpack=ON \
    -DTrilinos_ENABLE_AztecOO=ON \
    -DTrilinos_ENABLE_Sacado=ON \
    -DTrilinos_ENABLE_Teuchos=ON \
    -DTrilinos_ENABLE_MueLu:BOOL=ON \
    -DTrilinos_ENABLE_ML=ON \
    -DTrilinos_ENABLE_PyTrilinos=OFF \
    -DTrilinos_ENABLE_SEACAS=OFF \
    -DTrilinos_VERBOSE_CONFIGURE=OFF \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_VERBOSE_MAKEFILE=OFF \
    -DCMAKE_BUILD_TYPE=RELEASE \
    -DCMAKE_CXX_FLAGS="-g -O3" \
    -DCMAKE_C_FLAGS="-g -O3" \
    -DCMAKE_FORTRAN_FLAGS="-g -O5" \
    -DCMAKE_INSTALL_PREFIX=$TRILINOS ..
    make -j 20  && make install
    export INCLUDE=$TRILINOS/include:$INCLUDE
    export LIBRARY_PATH=$TRILINOS/lib:$LIBRARY_PATH
    export LD_LIBRARY_PATH=$TRILINOS/lib:$LD_LIBRARY_PATH
}

build_petsc()
{
    export PETSC=/opt/deal.II/petsc-3.6.4
    cd /mnt
    if [ -d petsc-3.6.4 ] ; then
        rm -rf petsc-3.6.4
    fi
    tar xf petsc-3.6.4.tar.gz
    cd petsc-3.6.4
    cp ../hypre.tar.bz2 .
    export PETSC_ARCH=linux-x86_64-gnu-intelmpi
    export PETSC_DIR=/mnt/petsc-3.6.4
    ./config/configure.py --download-hypre=./hypre.tar.bz2 --prefix=$PETSC --with-blas-lapack-dir=$MKLROOT/lib/intel64/ --with-mpi-dir=$I_MPI_ROOT/intel64/
    make PETSC_DIR=/mnt/petsc-3.6.4/ PETSC_ARCH=linux-x86_64-gnu-intelmpi all
    make PETSC_DIR=/mnt/petsc-3.6.4/ PETSC_ARCH=linux-x86_64-gnu-intelmpi install
    export INCLUDE=$PETSC/include:$INCLUDE
    export LIBRARY_PATH=$PETSC/lib:$LIBRARY_PATH
    export LD_LIBRARY_PATH=$PETSC/lib:$LD_LIBRARY_PATH
}

build_p4est()
{
    export P4EST=/opt/deal.II/p4est
    cd /mnt
    if [ -d p4est-1.1 ] ; then
        rm -rf p4est-1.1
    fi
    if [ -d p4est-build ] ; then
        rm -rf p4est-build
    fi
    ./p4est-setup.sh p4est-1.1.tar.gz $P4EST
    export INCLUDE=$P4EST/FAST/include:$INCLUDE
    export LIBRARY_PATH=$P4EST/FAST/lib:$LIBRARY_PATH
    export LD_LIBRARY_PATH=$P4EST/FAST/lib:$LD_LIBRARY_PATH
}

build_metis()
{
    export METIS=/opt/deal.II/metis
    cd /mnt
    if [ -d metis-5.1.0 ] ; then
        rm -rf metis-5.1.0
    fi
    tar xf metis-5.1.0.tar.gz
    cd metis-5.1.0
    make config prefix=$METIS
    make -j 20 && make install
    export INCLUDE=$METIS/include:$INCLUDE
    export LIBRARY_PATH=$METIS/lib:$LIBRARY_PATH
    export LD_LIBRARY_PATH=$METIS/lib:$LD_LIBRARY_PATH
}

build_dealii()
{
    export DEALII=/opt/deal.II/deal.II
    cd /mnt
    if [ -d dealii-8.4.1 ] ; then
        rm -rf dealii-8.4.1
    fi
    tar xf dealii-8.4.1.tar.gz && cd dealii-8.4.1
    mkdir build && cd build

    cmake \
    -DDEAL_II_WITH_MPI=ON \
    -DDEAL_II_WITH_LAPACK=ON \
    -DLAPACK_LIBRARIES=$MKLROOT/lib/intel64/libmkl_rt.so \
    -DLAPACK_DIR=$MKLROOT/lib/intel64/ \
    -DDEAL_II_WITH_P4EST=ON \
    -DP4EST_DIR=$P4EST \
    -DDEAL_II_WITH_TRILINOS=ON \
    -DTRILINOS_DIR=$TRILINOS \
    -DDEAL_II_WITH_PETSC=ON \
    -DPETSC_ARCH=$PETSC_ARCH \
    -DPETSC_DIR=$PETSC \
    -DMETIS_DIR=$METIS \
    -DCMAKE_INSTALL_PREFIX=$DEALII ..
    make -j 20 && make install
}

build_aspect()
{
    export ASPECT=/opt/deal.II/aspect
    cd /mnt
    if [ -d aspect-1.4.0 ] ; then
       rm -rf aspect-1.4.0
    fi
    tar xf aspect-1.4.0.tar.gz
    cd aspect-1.4.0
    mkdir build && cd build
    cmake \
    -DDEAL_II_DIR=$DEALII \
    -DCMAKE_INSTALL_PREFIX=$ASPECT ..
    make -j 20
    cp aspect $ASPECT
}

build_metis
build_trilinos
build_petsc
build_p4est
build_dealii
build_aspect
cd /mnt
if [ -d deal.II ] ; then
    rm -rf deal.II
fi
cp -r /opt/deal.II /mnt
