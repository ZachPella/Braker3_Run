# RepeatMasker Pipeline for Genome Annotation

-This document outlines the steps to run RepeatMasker on a genome assembly with trimmed FASTA headers. The pipeline includes loading necessary modules, setting up the environment, trimming FASTA headers, and executing RepeatMasker.

## Prerequisites

-Ensure the following m0dules are available on your system:

- `compiler/gcc/11`
- `openmpi/4.1`
- `hmmer/3.3`
- `trf`

## Step 1: Load Required Modules

-Load the necessary modules using the following commands:

```bash
module load compiler/gcc/11
module load openmpi/4.1
module load hmmer/3.3
module load trf
```

## Step 2: Set Up Environment
-Set the path to your local RepeatMasker installation:

'''bash
export PATH=/work/fauverlab/zachpella/RepeatMasker:$PATH
'''
## Navigate to the working directory:

'''bash
cd /work/fauverlab/zachpella '''

## Step 3: Trim FASTA Headers
-Trim the FASTA headers to a maximum of 30 characters using awk:

'''bash
awk '/^>/ {
   original_id = substr($0, 2);
   new_id = substr(original_id, 1, 30);
   $0 = ">" new_id;
} 1' input_genome.fasta > braker_ready_genome.fasta'''

## This command processes the input FASTA file MaSuRCA_config_purged_namericanus_withMito.fasta and outputs a new file trimmed_header_genome.fasta with trimmed headers.

## Step 4: Run RepeatMasker
-Execute RepeatMasker on the trimmed genome FASTA file:

'''bash
./RepeatMasker/RepeatMasker braker_ready_genome.fasta'''

## This command runs RepeatMasker with the default configuration on the trimmed_header_genome.fasta file.

## Conclusion
-This pipeline automates the process of trimming FASTA headers and running RepeatMasker for genome annotation. Ensure all dependencies are correctly installed and paths are properly set before executing the script.

-For any issues or further customization, refer to the RepeatMasker documentation or contact your system administrator.
