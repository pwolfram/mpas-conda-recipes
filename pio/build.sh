#!/bin/bash

export CFLAGS="-I$PREFIX/include $CFLAGS -target-cpu=sandybridge"
export LDFLAGS="-L$PREFIX/lib $LDFLAGS"

## edison hack
#{{{
set +e
. ~/.bashrc
. ~/.bash_profile
set -e

# get list of modules
# grep "\- /" modfiles | awk '{print $2}' > ~/.default_edison_module
tail ~/.default_edison_module | xargs -I{} echo 'module use' {} > modulesource.sh
. modulesource.sh


module avail &> modfiles
grep "\- /" modfiles
# build env modules: 'module -l list &> ~/.default_edison_list'
tail  ~/.default_edison_list -n +3 | awk '{print $1}' | xargs -I {} echo 'module load' {} > loadmodules.sh
. loadmodules.sh
module load darshan

#http://www.nersc.gov/users/computational-systems/edison/updates-and-status/open-issues/compiling-serial-codes-to-run-on-login-nodes-in-the-intel-programming-environment/
# note that this is a non-optimal hack
module unload craype-ivybridge
export CRAY_CPU_TARGET=sandybridge

module list
#}}}

cd pio

export NETCDF_PATH=`nc-config --prefix`
echo $NETCDF_PATH
#CONFIG_SHELL=/bin/bash bash configure \
./configure \
    --disable-debug \
    --prefix=$PREFIX
make
# make check testing
make install

cd ../testpio
make

rm -rf $PREFIX/share
