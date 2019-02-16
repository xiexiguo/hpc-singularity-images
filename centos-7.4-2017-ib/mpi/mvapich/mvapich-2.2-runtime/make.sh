#! /bin/bash
singularity exec -B $(pwd):/tmp /public/singularity/images/centos-7.4-2017/mvapich-2.2-devel.img cp -ra /opt/mvapich2 /tmp
cd mvapich2
rm -rf bin include libexec share
rm -rf lib/*.a
cd ..
singularity build /public/singularity/images/centos-7.4-2017/mvapich-2.2-runtime.img mvapich-2.2-runtime.def
rm -rf mvapich2
