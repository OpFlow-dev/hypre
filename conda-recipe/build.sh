#!/usr/bin/env bash
# Copyright (c) 1998 Lawrence Livermore National Security, LLC and other
# HYPRE Project Developers. See the top-level COPYRIGHT file for details.
#
# SPDX-License-Identifier: (Apache-2.0 OR MIT)

set -euxo pipefail

HYPRE_ENABLE_MPI="${HYPRE_ENABLE_MPI:-OFF}"
HYPRE_ENABLE_OPENMP="${HYPRE_ENABLE_OPENMP:-OFF}"

BUILD_DIR="${SRC_DIR}/_build"
: "${CPU_COUNT:=1}"
rm -rf "${BUILD_DIR}"

cmake -S "${SRC_DIR}/src" -B "${BUILD_DIR}" \
  -DCMAKE_BUILD_TYPE=Release \
  -DBUILD_SHARED_LIBS=ON \
  -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
  -DHYPRE_ENABLE_MPI="${HYPRE_ENABLE_MPI}" \
  -DHYPRE_ENABLE_OPENMP="${HYPRE_ENABLE_OPENMP}"

cmake --build "${BUILD_DIR}" --parallel "${CPU_COUNT}"
cmake --build "${BUILD_DIR}" --target install --parallel "${CPU_COUNT}"
