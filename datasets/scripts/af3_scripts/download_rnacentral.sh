#!/bin/bash

# Downloads RNAcentral data for the specified release using rsync.

set -e

if [[ $# -eq 0 ]]; then
  echo "Error: download directory must be provided as an input argument."
  exit 1
fi

DOWNLOAD_DIR="$1"
RELEASE="21.0"

ROOT_DIR="${DOWNLOAD_DIR}/rnacentral/${RELEASE}"
mkdir --parents "${ROOT_DIR}"

rsync -rlpt -v -z --delete \
  rsync.ebi.ac.uk::pub/databases/RNAcentral/releases/${RELEASE}/ \
  "${ROOT_DIR}"