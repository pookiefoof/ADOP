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
