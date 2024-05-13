#!/bin/bash

# Downloads and unzips the UniClust30 database.

set -e

if [[ $# -eq 0 ]]; then
  echo "Error: download directory must be provided as an input argument."
  exit 1
fi

if ! command -v aria2c &> /dev/null; then
  echo "Error: aria2c could not be found. Please install aria2c (sudo apt install aria2)."
  exit 1
fi

DOWNLOAD_DIR="$1"
ROOT_DIR="${DOWNLOAD_DIR}/uniclust30"
SOURCE_URL="https://wwwuser.gwdg.de/~compbiol/uniclust/2021_03/UniRef30_2021_03_hhsuite.tar.gz"
BASENAME=$(basename "${SOURCE_URL}")

mkdir --parents "${ROOT_DIR}"

aria2c "${SOURCE_URL}" --dir="${ROOT_DIR}"
tar --extract --verbose --file="${ROOT_DIR}/${BASENAME}" \
  --directory="${ROOT_DIR}"
rm "${ROOT_DIR}/${BASENAME}"