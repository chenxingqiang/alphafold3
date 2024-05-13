#!/bin/bash

# Downloads Chemical Component Dictionary (CCD) data.

set -e

if [[ $# -eq 0 ]]; then
  echo "Error: download directory must be provided as an input argument."
  exit 1
fi

DOWNLOAD_DIR="$1"
ROOT_DIR="${DOWNLOAD_DIR}/ccd"
BASE_URL="https://ftp.wwpdb.org/pub/pdb/data/monomers/components.cif"

mkdir --parents "${ROOT_DIR}"

aria2c "${BASE_URL}" --dir="${ROOT_DIR}"
aria2c "${BASE_URL}.gz" --dir="${ROOT_DIR}"