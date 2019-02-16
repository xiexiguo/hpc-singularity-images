From hpc/intelmpi:2018-devel as vasp-devel
COPY vasp.5.4.4.tar.gz /tmp/
RUN yum makecache fast && yum install -y rsync && yum clean all \
    && cd /tmp && tar xf vasp.5.4.4.tar.gz \
    && cd vasp.5.4.4 \
    && cp arch/makefile.include.linux_intel makefile.include  \
    && make all

From hpc/intelmpi:2018-runtime
COPY --from=vasp-devel /tmp/vasp.5.4.4/build/std/vasp /usr/local/bin/vasp_std
COPY --from=vasp-devel /tmp/vasp.5.4.4/build/gam/vasp /usr/local/bin/vasp_gam
COPY --from=vasp-devel /tmp/vasp.5.4.4/build/ncl/vasp /usr/local/bin/vasp_ncl
