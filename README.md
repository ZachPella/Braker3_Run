# Braker3 Run
# Braker3 Pipeline for Necator americanus Genome Annotation

## Overview
This pipeline implements Braker3 for annotating the Necator americanus genome using RNA-Seq and protein data. The pipeline is containerized using Singularity to ensure reproducibility and ease of deployment.

## Prerequisites
- Singularity installed on your system
- Input data:
  - Genome assembly (FASTA format)
  - RNA-Seq data (BAM format with XS tags)
  - Protein sequences database

## Container Setup

### Building the Singularity Container
```bash
singularity build braker3.sif docker://teambraker/braker3:latest
```

## Input Data Requirements

### RNA-Seq Alignment Requirements
- BAM files must contain XS (strand) tags for spliced reads
- For HISAT2 alignments: use `--dta` option
- For STAR alignments: use `--outSAMstrandField intronMotif` option
- TopHat alignments include required tags by default

### Required Files
1. Genome assembly file (FASTA format)
2. Protein sequence database (FASTA format)
3. RNA-Seq data in one of the following formats:
   - SRA accession IDs
   - Unaligned reads (FASTQ format)
   - Aligned reads (BAM format)

## Pipeline Execution

### Basic Usage
```bash
singularity exec braker3.sif braker.pl \
    --genome=necator_genome.fa \
    --prot_seq=protein_db.fa \
    --bam=rnaseq1.bam,rnaseq2.bam \
    --species=necator_americanus
```

### Alternative Usage with SRA Data
```bash
singularity exec braker3.sif braker.pl \
    --genome=necator_genome.fa \
    --prot_seq=protein_db.fa \
    --rnaseq_sets_ids=SRR_ID1,SRR_ID2 \
    --species=necator_americanus
```

## Output Files

### Primary Output Files
1. `braker.gtf`: Final gene set combining AUGUSTUS and GeneMark-ETP predictions
2. `braker.codingseq`: Coding sequences in FASTA format
3. `braker.aa`: Protein sequences in FASTA format
4. `braker.gff3`: Gene predictions in GFF3 format (if --gff3 flag used)

### Additional Output Directories
- `Augustus/`: Contains AUGUSTUS gene predictions
- `GeneMark-E*/`: Contains GeneMark-ETP predictions
- `braker_original/`: Original predictions before BUSCO completeness improvement
- `bbc/`: BUSCO completeness improvement results

## Output File Formats

### GTF Format Example
```
HS04636 AUGUSTUS initial   966 1017 . + 0 transcript_id "g1.1"; gene_id "g1";
HS04636 AUGUSTUS internal 1818 1934 . + 2 transcript_id "g1.1"; gene_id "g1";
```

Columns:
1. seqname
2. source
3. feature
4. start
5. end
6. score
7. strand
8. frame
9. transcript ID and gene ID

## Visualization
If using the `--makehub` option with MakeHub installed:
1. A `hub_` directory will be created
2. Copy this directory to a public web server
3. Use the `hub.txt` file link with UCSC Genome Browser for visualization

## Troubleshooting
- Ensure BAM files contain proper XS tags
- Verify all input files are in correct formats
- Check write permissions for AUGUSTUS config directory
- Monitor log files in working directory for error messages

## References
- BRAKER3 Documentation: [Docker Hub](https://hub.docker.com/r/teambraker/braker3)
- GeneMark-ETP: [GitHub](http://github.com/gatech-genemark/GeneMark-ETP)
- AUGUSTUS: [GitHub](https://github.com/Gaius-Augustus/Augustus)
