#!/bin/bash

set -ex


if [[ $(uname -m) == "ppc64le" ]]; then
      sed -i.bak 's,march=native,mcpu=native,' GKlibSystem.cmake
fi

mkdir -p build

pushd build

cmake -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      -DDEBUG=OFF \
      -DOPENMP=set \
      -DBUILD_SHARED_LIBS=ON \
      ..

cmake --build . --config Release
cmake --install .
