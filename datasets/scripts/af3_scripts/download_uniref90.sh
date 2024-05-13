#!/bin/bash

# Downloads UniProt UniRef data for the specified releases using rsync.

set -e

if [[ $# -eq 0 ]]; then
  echo "Error: download directory must be provided as an input argument."
  exit 1
fi

DOWNLOAD_DIR="$1"
ROOT_DIR="${DOWNLOAD_DIR}/uniprot/uniref"

RELEASES=(
  "release-2020_01"
  "release-2020_03"
  "release-2022_05"
)

for RELEASE in "${RELEASES[@]}"; do
  RELEASE_DIR="${ROOT_DIR}/${RELEASE}"
  mkdir --parents "${RELEASE_DIR}"

  rsync -rlpt -v -z --delete \
    rsync.ebi.ac.uk::pub/databases/uniprot/previous_releases/${RELEASE}/uniref/ \
    "${RELEASE_DIR}"
done