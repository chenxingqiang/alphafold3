#!/bin/bash

# Downloads MGnify peptide database for the specified versions using rsync.

set -e

if [[ $# -eq 0 ]]; then
  echo "Error: download directory must be provided as an input argument."
  exit 1
fi

DOWNLOAD_DIR="$1"
VERSIONS=("2018_12" "2022_05")

for VERSION in "${VERSIONS[@]}"; do
  ROOT_DIR="${DOWNLOAD_DIR}/mgnify/${VERSION}"
  mkdir --parents "${ROOT_DIR}"

  rsync -rlpt -v -z --delete \
    rsync.ebi.ac.uk::pub/databases/metagenomics/peptide_database/${VERSION}/ \
    "${ROOT_DIR}"
done