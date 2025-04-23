#!/bin/bash
#SBATCH --time=4:00:00
#SBATCH --mem=16G
#SBATCH --cpus-per-task=8
#SBATCH --job-name=featureCounts
#SBATCH --output=featureCounts.%j.out
#SBATCH --error=featureCounts.%j.err

module load subread

featureCounts -p -T 8 -t exon -g gene_id \
  -a braker.gtf \
  -o gene_counts.txt \
  Na-2-female*.bam Na-3-male*.bam Na-L3*.bam

