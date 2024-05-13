#!/bin/bash

# Downloads sequence clusters data.

set -e

if [[ $# -eq 0 ]]; then
  echo "Error: download directory must be provided as an input argument."
  exit 1
fi

DOWNLOAD_DIR="$1"
ROOT_DIR="${DOWNLOAD_DIR}/sequence_clusters"
SOURCE_URL="https://cdn.rcsb.org/resources/sequence/clusters/clusters-by-entity-40.txt"
FILENAME=$(basename "${SOURCE_URL}")

mkdir --parents "${ROOT_DIR}"

curl -sSL -o "${ROOT_DIR}/${FILENAME}" "${SOURCE_URL}"