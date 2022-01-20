#!/bin/bash

git submodule update --init --recursive --jobs 0
source $(conda info --base)/etc/profile.d/conda.sh
conda activate adop

export CC=gcc
export CXX=g++
export CUDAHOSTCXX=g++
echo "Using g++-7"

unset CUDA_HOME

cd /data/ADOP

mkdir build
cd build
export CONDA=${CONDA_PREFIX:-"$(dirname $(which conda))/../"}
cmake -DCMAKE_PREFIX_PATH="${CONDA}/lib/python3.9/site-packages/torch/;${CONDA}" -DADOP_HEADLESS=ON ..
make -j10
