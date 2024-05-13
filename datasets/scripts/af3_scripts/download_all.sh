#!/bin/bash

# Downloads all the required datasets using individual download scripts.

set -e

if [[ $# -eq 0 ]]; then
  echo "Error: download directory must be provided as an input argument."
  exit 1
fi

DOWNLOAD_DIR="$1"

# Download PDB mmCIF data
bash download_pdb_mmcif.sh "${DOWNLOAD_DIR}"

# Download PDB obsolete data
bash download_pdb_obsolete.sh "${DOWNLOAD_DIR}"

# Download sequence clusters data
bash download_sequence_clusters.sh "${DOWNLOAD_DIR}"

# Download Chemical Component Dictionary (CCD) data
bash download_ccd.sh "${DOWNLOAD_DIR}"

# Download UniClust30 data
bash download_uniclust30.sh "${DOWNLOAD_DIR}"

# Download UniRef90 data
bash download_uniref90.sh "${DOWNLOAD_DIR}"

# Download MGnify data
bash download_mgnify.sh "${DOWNLOAD_DIR}"

# Download BFD data
bash download_bfd.sh "${DOWNLOAD_DIR}"

# Download PDB mmCIF assembly data
bash download_pdb_mmcif_assembly.sh "${DOWNLOAD_DIR}"

# Download Rfam data
bash download_rfam.sh "${DOWNLOAD_DIR}"

# Download JASPAR data
bash download_jaspar.sh "${DOWNLOAD_DIR}"

# Download RNAcentral data
bash download_rnacentral.sh "${DOWNLOAD_DIR}"

# Download SELEX data
bash download_selex.sh "${DOWNLOAD_DIR}"

# Download PDB derived data
bash download_pdb_derived_data.sh "${DOWNLOAD_DIR}"

# Download UniProt UniRef data
bash download_uniref.sh "${DOWNLOAD_DIR}"

echo "All datasets downloaded successfully!"