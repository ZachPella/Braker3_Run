# Braker3 Pipeline for Necator americanus Genome Annotation and Functional Annotation
## Overview
This pipeline implements Braker3 for annotating the Necator americanus genome using RNA-Seq and protein data. The pipeline is containerized using Singularity to ensure reproducibility and ease of deployment. The directory structure is organized to streamline the annotation process, from data preparation to post-annotation analyses.

## Directory Structure
The pipeline is organized into the following directories:

| Directory/File                     | Description                                                                 |
|------------------------------------|-----------------------------------------------------------------------------|
| `braker_run/`                      | Root directory for the Braker3 pipeline.                                    |
| ├── `braker_directories/`          | Directory for Braker3 intermediate files.                                   |
| │   └── `.gitkeep`                 | Empty file to preserve the directory in Git.                                |
| ├── `Download_Augustus.md`         | Instructions for downloading AUGUSTUS.                                      |
| ├── `Download_GeneMark.md`         | Instructions for downloading GeneMark.                                      |
| ├── `Download_HISAT2_and_SRAtoolkit.md` | Instructions for downloading HISAT2 and SRA toolkit.                     |
| ├── `other_downloads_for_GeneMark.md` | Additional instructions for GeneMark setup.                              |
| ├── `genomes/`                     | Directory for genome files.                                                 |
| │   └── `.gitkeep`                 | Empty file to preserve the directory in Git.                                |
| ├── `post_braker/`                 | Directory for post-Braker analysis scripts.                                 |
| │   ├── `blast_analysis/`          | Directory for BLAST analysis scripts.                                       |
| │   │   ├── `.gitkeep`             | Empty file to preserve the directory in Git.                                |
| │   │   └── `run_blast.sh`         | Script to run BLAST analysis.                                               |
| │   ├── `busco_analysis/`          | Directory for BUSCO analysis scripts.                                       |
| │   │   ├── `.gitkeep`             | Empty file to preserve the directory in Git.                                |
| │   │   └── `run_busco.sh`         | Script to run BUSCO analysis.                                               |
| │   ├── `interproscan_analysis/`   | Directory for InterProScan analysis scripts.                                |
| │   │   ├── `.gitkeep`             | Empty file to preserve the directory in Git.                                |
| │   │   └── `run_interproscan.sh`  | Script to run InterProScan analysis.                                        |
| │   └── `orthofinder_analysis/`    | Directory for OrthoFinder analysis scripts.                                 |
| │       ├── `.gitkeep`             | Empty file to preserve the directory in Git.                                |
| │       └── `quality_check_braker.aa_file.sh` | Script for quality checks on Braker output.                     |
| ├── `pre_braker/`                  | Directory for pre-Braker setup files.                                       |
| │   ├── `proteins/`                | Directory for protein sequence files.                                       |
| │   │   └── `.gitkeep`             | Empty file to preserve the directory in Git.                                |
| │   └── `.gitkeep`                 | Empty file to preserve the directory in Git.                                |
| ├── `README.md`                    | Main documentation file for the pipeline.                                   |
| └── `braker3sif.md`                | Documentation for the Braker3 Singularity container setup.                  |
## Prerequisites
Before running the pipeline, ensure the following are installed and configured:

- Singularity: Required for running the Braker3 container.

- Input Data:

  - Genome assembly (FASTA format)

  - RNA-Seq data (BAM format with XS tags)

  - Protein sequences database (FASTA format)

## Container Setup
### Building the Singularity Container
- To build the Braker3 Singularity container, run:

```bash
singularity build braker3.sif docker://teambraker/braker3:latest
```

## Input Data Requirements
### RNA-Seq Alignment Requirements
- BAM files must contain XS (strand) tags for spliced reads.

- For HISAT2 alignments: Use the --dta option.

- For STAR alignments: Use the --outSAMstrandField intronMotif option.

- TopHat alignments include the required tags by default.
### Required Files
- Genome assembly file (FASTA format)

- Protein sequence database (FASTA format)

- RNA-Seq data in one of the following formats:

 - SRA accession IDs

 - Unaligned reads (FASTQ format)

 - Aligned reads (BAM format)

## Pipeline Execution
### Basic Usage
- To run Braker3 with a genome, protein database, and RNA-Seq BAM files:

```bash
singularity exec braker3.sif braker.pl \
    --genome=necator_genome.fa \
    --prot_seq=protein_db.fa \
    --bam=rnaseq1.bam,rnaseq2.bam \
    --species=necator_americanus
```
## Alternative Usage with SRA Data
- To run Braker3 using SRA accession IDs:

```bash
singularity exec braker3.sif braker.pl \
    --genome=necator_genome.fa \
    --prot_seq=protein_db.fa \
    --rnaseq_sets_ids=SRR_ID1,SRR_ID2 \
    --species=necator_americanus
```
## Output Files
### Primary Output Files
- braker.gtf: Final gene set combining AUGUSTUS and GeneMark-ETP predictions.

- braker.codingseq: Coding sequences in FASTA format.

- braker.aa: Protein sequences in FASTA format.

- braker.gff3: Gene predictions in GFF3 format (if --gff3 flag is used).

### Additional Output Directories
- Augustus/: Contains AUGUSTUS gene predictions.

- GeneMark-E*/: Contains GeneMark-ETP predictions.

- braker_original/: Original predictions before BUSCO completeness improvement.

- bbc/: BUSCO completeness improvement results.

## Post-Braker Analysis
The post_braker/ directory contains scripts and directories for downstream analyses:

### Blast Analysis
- Script: run_blast.sh

- Purpose: Perform BLAST analysis on annotated protein sequences.

### BUSCO Analysis
- Script: run_busco.sh

- Purpose: Assess the completeness of the annotated genome using BUSCO.

### InterProScan Analysis
- Script: run_interproscan.sh

- Purpose: Annotate protein domains and functional sites.

### OrthoFinder Analysis
- Script: quality_check_braker.aa_file.sh

- Purpose: Perform orthology analysis and quality checks on annotated proteins.

## Visualization
If using the --makehub option with MakeHub installed:

- A hub_/ directory will be created.

- Copy this directory to a public web server.

- Use the hub.txt file link with the UCSC Genome Browser for visualization.

## Troubleshooting
- Ensure BAM files contain proper XS tags.

- Verify all input files are in the correct formats.

- Check write permissions for the AUGUSTUS config directory.

- Monitor log files in the working directory for error messages.

## References
- BRAKER3 Documentation: Docker Hub

- GeneMark-ETP: GitHub

- AUGUSTUS: GitHub
