#!/bin/bash

export CFLAGS="-I$PREFIX/include $CFLAGS"
export LDFLAGS="-L$PREFIX/lib $LDFLAGS"

## edison specific flags
##{{{
#mkdir -p /var/tmp/${USER}-env
#chmod 700 /var/tmp/${USER}-env
#export _MODULESBEGINENV_=/var/tmp/${USER}-env/.modulesbeginenv
#. /opt/modules/default/init/bash
#module add modules/3.2.10.4
#
#export CRAY_CPU_TARGET=sandybridge
#export MAN_POSIXLY_CORRECT=1
#export LIBGL_ALWAYS_INDIRECT=1
#export MPICH_MPIIO_DVS_MAXNODES=14
#export DVS_MAXNODES=1__
#export MPICH_GNI_ROUTING_MODE=ADAPTIVE_1
##ZZ 1/15/2016 to disable the --craype-buildtools-check in craype/2.5.0
#export CRAYPE_USE_BUILDTOOLS=0
#module load darshan
#
#
#export FORT_BUFFERED=yes
#if [ -z "$INTEL_LICENSE_FILE" ]; then
#  export INTEL_LICENSE_FILE=28518@dmv1.nersc.gov:28518@dmv.nersc.gov
#fi
##}}}
#module load usg-default-modules

#CONFIG_SHELL=/bin/bash bash configure \
./configure \
    --disable-debug \
    --disable-dependency-tracking \
    --disable-silent-rules \
    --prefix=$PREFIX
make
# make check testing
make install

rm -rf $PREFIX/share
