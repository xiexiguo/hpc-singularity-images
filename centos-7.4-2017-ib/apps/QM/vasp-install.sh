#! /bin/bash
cd /mnt
tar xf vasp.5.4.4.tar.gz
yum install -y rsync
yum clean all
cd /mnt/vasp.5.4.4
cp arch/makefile.include.linux_intel makefile.include
make all
mkdir -p /mnt/QM/vasp-5.4.4
cp bin/std/vasp /mnt/QM/vasp/5.4.4-vasp_std
cp bin/ncl/vasp /mnt/QM/vasp/5.4.4-vasp_ncl
cp bin/gam/vasp /mnt/QM/vasp/5.4.4-vasp_gam
