#!/bin/bash

"""
RepeatMasker Processing Script

This script processes a FASTA file by trimming the headers to the first 30 characters and then runs RepeatMasker
to identify and mask repetitive sequences in the genome. The input FASTA file is assumed to be named 
`ref_genome.fasta`, and the resulting masked genome is saved after processing.

Steps:
1. Load the necessary modules (`gcc`, `openmpi`, `hmmer`, `trf`) required for RepeatMasker and other tools.
2. Set the path to your local RepeatMasker installation.
3. Trim the headers of the input FASTA file (`ref_genome.fasta`) to a maximum of 30 characters.
4. Run RepeatMasker on the trimmed FASTA file and store the results in the output directory.

Parameters
----------
None

Returns
-------
None

Notes
-----
- The script assumes that the local RepeatMasker directory is located at `/work/fauverlab/zachpella/RepeatMasker`.
- The input FASTA file (`MaSuRCA_config_purged_namericanus_withMito.fasta`) should be located in the working directory `/work/fauverlab/zachpella/`.
- The trimmed genome with updated headers is saved as `trimmed_header_genome.fasta` in the same directory.
- The results from RepeatMasker are outputted in the same directory where the script is executed.

Example
-------
>>> ./repeat_masker_processing.sh
"""

# Load required modules
module load compiler/gcc/11
module load openmpi/4.1
module load hmmer/3.3
module load trf

# Set path to your local RepeatMasker
export PATH=/braker_run/braker_directories/RepeatMasker:$PATH

cd /braker_run

# Trim FASTA headers - Limit headers to the first 30 characters after the '>'
awk '/^>/ {
   original_id = substr($0, 2);
   new_id = substr(original_id, 1, 30);  # Limit to 30 characters for new header
   $0 = ">" new_id;
} 1' /braker_run/genomes/ref_genome.fasta > /braker_run/genomes/trimmed_header_genome.fasta

# Run RepeatMasker with the working configuration
/braker_run/braker_directories/RepeatMasker/RepeatMasker /braker_run/genomes/trimmed_header_genome.fasta
