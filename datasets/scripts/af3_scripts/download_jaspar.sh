#!/bin/bash

# Downloads JASPAR CORE data for the specified years using wget.

set -e

if [[ $# -eq 0 ]]; then
  echo "Error: download directory must be provided as an input argument."
  exit 1
fi

DOWNLOAD_DIR="$1"
YEARS=("2022" "2024")

for YEAR in "${YEARS[@]}"; do
  ROOT_DIR="${DOWNLOAD_DIR}/JASPAR${YEAR}/CORE"
  mkdir --parents "${ROOT_DIR}"

  BASE_URL="https://jaspar.elixir.no/download/data/${YEAR}/CORE"
  FILES=(
    "JASPAR${YEAR}_CORE_non-redundant_pfms_jaspar.txt"
    "JASPAR${YEAR}_CORE_non-redundant_pfms_meme.txt"
    "JASPAR${YEAR}_CORE_non-redundant_pfms_transfac.txt"
    "JASPAR${YEAR}_CORE_redundant_pfms_jaspar.txt"
    "JASPAR${YEAR}_CORE_redundant_pfms_meme.txt"
    "JASPAR${YEAR}_CORE_redundant_pfms_transfac.txt"
    "JASPAR${YEAR}_CORE_non-redundant_pfms_jaspar.zip"
    "JASPAR${YEAR}_CORE_non-redundant_pfms_meme.zip"
    "JASPAR${YEAR}_CORE_non-redundant_pfms_transfac.zip"
    "JASPAR${YEAR}_CORE_redundant_pfms_jaspar.zip"
    "JASPAR${YEAR}_CORE_redundant_pfms_meme.zip"
    "JASPAR${YEAR}_CORE_redundant_pfms_transfac.zip"
  )

  for FILE in "${FILES[@]}"; do
    wget -P "${ROOT_DIR}" "${BASE_URL}/${FILE}"
  done
done