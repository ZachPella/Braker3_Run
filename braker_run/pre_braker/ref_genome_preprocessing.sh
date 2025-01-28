"""
A script for preparing and running RepeatMasker on a genome FASTA file.

This script:
1. Loads necessary modules for the environment.
2. Sets the PATH variable to include the local RepeatMasker installation.
3. Trims the headers of a given genome FASTA file to ensure compatibility.
4. Runs RepeatMasker on the processed FASTA file.

Environment Setup:
- `module load` commands are used to ensure required compilers and tools are available.
- The PATH is updated to include the RepeatMasker installation.

Steps:
1. Trims FASTA headers to a maximum of 30 characters.
2. Executes RepeatMasker on the trimmed genome FASTA file.

Example:
    $ module load compiler/gcc/11
    $ module load openmpi/4.1
    $ module load hmmer/3.3
    $ module load trf
    $ export PATH=/work/fauverlab/zachpella/RepeatMasker:$PATH
    $ cd /work/fauverlab/zachpella
    $ awk '/^>/ {
           original_id = substr($0, 2);
           new_id = substr(original_id, 1, 30);
           $0 = ">" new_id;
       } 1' MaSuRCA_config_purged_namericanus_withMito.fasta > trimmed_header_genome.fasta
    $ ./RepeatMasker/RepeatMasker trimmed_header_genome.fasta

Functions:
---------
1. **Environment Setup**:
    - Load necessary tools (GCC, OpenMPI, HMMER, TRF).
    - Update PATH for RepeatMasker.

2. **Header Trimming**:
    - Trims FASTA headers to ensure compliance with tools that limit header lengths.

3. **RepeatMasker Execution**:
    - Runs RepeatMasker with the trimmed genome FASTA file.

Returns:
-------
- `trimmed_header_genome.fasta`: The processed genome FASTA file with trimmed headers.
- RepeatMasker output files (e.g., `.out`, `.tbl`, `.masked`).

Notes:
-----
- Ensure RepeatMasker is correctly installed in `/work/fauverlab/zachpella/RepeatMasker`.
- The input FASTA file should be in the same directory.
"""
