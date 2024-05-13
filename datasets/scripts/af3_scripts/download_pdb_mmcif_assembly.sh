#!/bin/bash

# Downloads PDB mmCIF assembly files using rsync.

set -e

if [[ $# -eq 0 ]]; then
  echo "Error: download directory must be provided as an input argument."
  exit 1
fi

DOWNLOAD_DIR="$1"
ROOT_DIR="${DOWNLOAD_DIR}/pdb_mmcif_assembly"

mkdir --parents "${ROOT_DIR}"

rsync -rlpt -v -z --delete --include="*.cif.gz" --exclude="*" \
  rsync.rcsb.org::ftp_data/structures/divided/mmCIF/ \
  "${ROOT_DIR}"