#! /bin/bash
mkdir QM
echo 'Build abinit...'
singularity exec -B $(pwd):/mnt /public/singularity/images/centos-7.4-2017/intelmpi-devel.img  /mnt/abinit-install.sh

echo 'Build cp2k...'
singularity exec -B $(pwd):/mnt /public/singularity/images/centos-7.4-2017/intelmpi-devel.img  /mnt/cp2k-install.sh

echo 'Build openmx...'
singularity exec -B $(pwd):/mnt /public/singularity/images/centos-7.4-2017/intelmpi-devel.img  /mnt/openmx-install.sh

echo 'Build qe...'
singularity exec -B $(pwd):/mnt /public/singularity/images/centos-7.4-2017/intelmpi-devel.img  /mnt/qe-install.sh

echo 'Build vasp...'
singularity exec -B $(pwd):/mnt /public/singularity/images/centos-7.4-2017/intelmpi-devel.img  /mnt/vasp-install.sh

singularity build /public/singularity/images/centos-7.4-2017/QM-intelmpi.img QM-intelmpi.def
