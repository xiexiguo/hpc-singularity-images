From hpc/intelmpi:2018-devel as qe-devel
COPY qe-6.2.tar.gz /tmp/
RUN cd /tmp && tar xf qe-6.2.tar.gz \
    && cd qe-6.2 \
    && ./configure --prefix=/opt/qe-6.2 --with-scalapack=intel --enable-parallel --enable-openmp --enable-debug --disable-option-checking \
   CC=icc FC=ifort F77=ifort MPICC=mpiicc MPIF90=mpiifort  \
    && make all && make install

From hpc/intelmpi:2018-runtime
COPY --from=qe-devel /opt/qe-6.2/ /opt/qe-6.2/
ENV CP_QE_DIR=/opt/qe-6.2
ENV PATH=${CP_QE_DIR}/bin:$PATH
