#!/bin/bash

# Downloads PDB mmCIF files using rsync.

set -e

if [[ $# -eq 0 ]]; then
  echo "Error: download directory must be provided as an input argument."
  exit 1
fi

DOWNLOAD_DIR="$1"
ROOT_DIR="${DOWNLOAD_DIR}/pdb_mmcif"

mkdir --parents "${ROOT_DIR}"

rsync -rlpt -v -z --delete --port=33444 \
  rsync.rcsb.org::ftp_data/structures/divided/mmCIF/ \
  "${ROOT_DIR}"