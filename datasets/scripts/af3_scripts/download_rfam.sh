#!/bin/bash

# Downloads Rfam database using rsync.

set -e

if [[ $# -eq 0 ]]; then
  echo "Error: download directory must be provided as an input argument."
  exit 1
fi

DOWNLOAD_DIR="$1"
ROOT_DIR="${DOWNLOAD_DIR}/rfam"
RFAM_VERSION="14.9"

mkdir --parents "${ROOT_DIR}"

rsync -rlpt -v -z --delete \
  rsync.ebi.ac.uk::pub/databases/Rfam/${RFAM_VERSION}/ \
  "${ROOT_DIR}/${RFAM_VERSION}"