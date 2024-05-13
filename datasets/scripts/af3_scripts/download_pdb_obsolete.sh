#!/bin/bash

# Downloads PDB obsolete data using rsync.

set -e

if [[ $# -eq 0 ]]; then
  echo "Error: download directory must be provided as an input argument."
  exit 1
fi

DOWNLOAD_DIR="$1"
ROOT_DIR="${DOWNLOAD_DIR}/pdb_obsolete"

mkdir --parents "${ROOT_DIR}"

rsync -rlpt -v -z --delete \
  rsync.wwpdb.org::ftp_data/structures/obsolete/mmCIF/ \
  "${ROOT_DIR}"