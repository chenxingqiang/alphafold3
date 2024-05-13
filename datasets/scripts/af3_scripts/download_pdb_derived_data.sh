#!/bin/bash

# Downloads PDB derived data using rsync.

set -e

if [[ $# -eq 0 ]]; then
  echo "Error: download directory must be provided as an input argument."
  exit 1
fi

DOWNLOAD_DIR="$1"
ROOT_DIR="${DOWNLOAD_DIR}/pdb_derived_data"

mkdir --parents "${ROOT_DIR}"

rsync -rlpt -v -z --delete \
  rsync.rcsb.org::ftp_derived/derived_data/ \
  "${ROOT_DIR}"