#!/bin/bash

git submodule update --init --recursive --jobs 0
source $(conda info --base)/etc/profile.d/conda.sh
conda activate adop

gcc --version
which gcc

cd External/pytorch

export CC=$(which gcc)
export CXX=$(which g++)
export CUDAHOSTCXX=$(which g++)
echo "Using g++-7"

unset CUDA_HOME

export CMAKE_PREFIX_PATH=${CONDA_PREFIX:-"$(dirname $(which conda))/../"}
export nproc=16
python setup.py install

# cd /data

# wget https://github.com/protocolbuffers/protobuf/releases/download/v3.13.0/protobuf-cpp-3.13.0.zip
# unzip protobuf-cpp-3.13.0.zip && cd protobuf-3.13.0
# ./autogen.sh
# ./configure --prefix=/data/miniconda3/envs/adop 
# make -j$(nproc)
# make check
# make install && ldconfig
