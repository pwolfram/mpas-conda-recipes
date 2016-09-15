#!/bin/bash

export CFLAGS="-I$PREFIX/include $CFLAGS"
export LDFLAGS="-L$PREFIX/lib $LDFLAGS"

./configure \
    --disable-dap \
    --disable-dap-remote-tests \
    --enable-static \
    --enable-shared \
    --prefix=$PREFIX
make
make install

rm -rf $PREFIX/share
