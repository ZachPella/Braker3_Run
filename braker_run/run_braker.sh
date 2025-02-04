#!/bin/bash
#SBATCH --time=7-00:00:00
#SBATCH --mem-per-cpu=20G
#SBATCH --job-name=braker_run
#SBATCH --output=braker.%j.out
#SBATCH --error=braker.%j.err
#SBATCH --cpus-per-task=8
#SBATCH --partition=batch

module load SRAtoolkit

# Directory setup
WORK_DIR="/main"
BRAKER_DIR="$WORK_DIR/braker_run"
AUGUSTUS_CONFIG="$BRAKER_DIR/augustus_config"

# Create Augustus config directory
mkdir -p "$AUGUSTUS_CONFIG"

# Use singularity to copy Augustus config interactively
singularity exec \
  -B "$WORK_DIR:$WORK_DIR" \
  "$WORK_DIR/braker3.sif" \
  bash -c "cp -R /opt/Augustus/config/* $AUGUSTUS_CONFIG/"

# Run BRAKER
singularity exec \
  -B "$WORK_DIR:$WORK_DIR" \
  "$WORK_DIR/braker3.sif" \
  braker.pl \
  --genome="$BRAKER_DIR/genomes/trimmed_header_genome.fasta" \
  --prot_seq="$BRAKER_DIR/proteins/necator_americanus.PRJNA72135.WBPS19.protein.fa" \
  --rnaseq_sets_ids=SRR609857,SRR609878,SRR609884,SRR609893,SRR609894,SRR609951 \
  --species=namericanus \
  --workingdir="$BRAKER_DIR" \
  --AUGUSTUS_CONFIG_PATH="$AUGUSTUS_CONFIG" \
  --useexisting \
  --verbosity=3 \
  --threads=8
