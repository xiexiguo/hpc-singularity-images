#! /bin/bash
tar xf vasp.5.4.4.tar.gz
cp vasp.5.4.4/arch/makefile.include.linux_intel vasp.5.4.4/makefile.include
singularity exec -B $(pwd):/mnt /public/singularity/images/centos-7.4-2017/intelmpi-devel.img  /mnt/install.sh
cp vasp.5.4.4/build/std/vasp vasp_std
cp vasp.5.4.4/build/gam/vasp vasp_gam
cp vasp.5.4.4/build/ncl/vasp vasp_ncl
singularity build /public/singularity/images/centos-7.4-2017/vasp-5.4.4.img vasp-5.4.4-intelmpi.def
rm -rf vasp.5.4.4 vasp_std vasp_ncl vasp_gam
