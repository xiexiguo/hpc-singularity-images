#! /bin/bash
tar xf vasp.5.4.4.tar.gz
cp makefile.include vasp.5.4.4/
singularity exec -B $(pwd):/mnt /public/singularity_images/centos-7.4-2016/mvapich-2.2-devel.img  /mnt/install.sh
cp vasp.5.4.4/build/std/vasp vasp_std
cp vasp.5.4.4/build/gam/vasp vasp_gam
cp vasp.5.4.4/build/ncl/vasp vasp_ncl
singularity build /public/singularity_images/centos-7.4-2016/vasp-5.4.4-mvapich.img vasp-5.4.4-mvapich.def
rm -rf vasp.5.4.4 vasp_std vasp_ncl vasp_gam
