#! /bin/bash
cd /mnt
tar xf openmx3.8.tar.gz
cd /mnt/openmx3.8/source
make all
cd ..
cp -r work /mnt/QM/OpenMX-3.8.3/
