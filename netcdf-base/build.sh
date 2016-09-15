#!/bin/bash

export CFLAGS="-I$PREFIX/include $CFLAGS"
export LDFLAGS="-L$PREFIX/lib $LDFLAGS"

./configure \
    --enable-shared \
    --enable-static \
    --disable-dap \
    --disable-dap-remote-tests \
    --disable-netcdf-4 \
    --disable-doxygen \
    --prefix=$PREFIX
make
make install

rm -rf $PREFIX/share
