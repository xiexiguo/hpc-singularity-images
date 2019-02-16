#! /bin/bash
singularity exec -B $(pwd):/tmp /public/singularity/images/centos-7.4-2017/openmpi-2.1.2-devel.img cp -r /opt/openmpi /tmp
pushd openmpi
rm -rf include etc bin share 
popd
singularity build /public/singularity/images/centos-7.4-2017/openmpi-2.1.2-runtime.img openmpi-2.1.2-runtime.def
rm -rf openmpi
