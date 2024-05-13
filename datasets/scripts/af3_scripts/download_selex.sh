#!/bin/bash

# Downloads SELEX protein sequences data using wget.

set -e

if [[ $# -eq 0 ]]; then
  echo "Error: download directory must be provided as an input argument."
  exit 1
fi

DOWNLOAD_DIR="$1"
ROOT_DIR="${DOWNLOAD_DIR}/selex"

mkdir --parents "${ROOT_DIR}"

FILES=(
  "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC8009048/bin/NIHMS1670407-supplement-Supplemental_tables_S1-6.xlsx"
  "https://static-content.springer.com/esm/art%3A10.1038%2Fnature15518/MediaObjects/41586_2015_BFnature15518_MOESM33_ESM.xlsx"
)

for FILE_URL in "${FILES[@]}"; do
  FILE=$(basename "${FILE_URL}")
  wget -P "${ROOT_DIR}" "${FILE_URL}"
done