IIBOOST_LDFLAGS="${LDFLAGS} -Wl,-rpath,${PREFIX}/lib -L${PREFIX}/lib"
IIBOOST_CXXFLAGS="${CFLAGS} -std=c++11"

mkdir build
cd build
cmake .. \
    -DCMAKE_C_COMPILER=${PREFIX}/bin/gcc \
    -DCMAKE_CXX_COMPILER=${PREFIX}/bin/g++ \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=${PREFIX} \
    -DCMAKE_PREFIX_PATH=${PREFIX} \
    -DCMAKE_CXX_FLAGS="${IIBOOST_CXXFLAGS}" \
    -DCMAKE_SHARED_LINKER_FLAGS="${IIBOOST_LDFLAGS}" \
    -DCMAKE_EXE_LINKER_FLAGS="${IIBOOST_LDFLAGS}" \
    -DBUILD_PYTHON_WRAPPER=1 \
    -DPYTHON_BASE_PATH=${PREFIX} \
    -DITK_DIR=${PREFIX}/lib/cmake/ITK-4.6 \
##

# BUILD
make -j${CPU_COUNT}

# "install" to the build prefix (conda will relocate these files afterwards)
make install
