# SRA Toolkit

-If you want **BRAKER** to download RNA-Seq libraries from **NCBI's SRA**, the **SRA Toolkit** is required. You can download a precompiled version of the SRA Toolkit from the following link:

- **Download SRA Toolkit**: [http://daehwankimlab.github.io/hisat2/download/#version-hisat2-221](http://daehwankimlab.github.io/hisat2/download/#version-hisat2-221)

### Usage with BRAKER

- BRAKER will attempt to locate the SRA Toolkit executables (`fastq-dump`, `prefetch`) using the environment variable `$SRATOOLS_PATH`.
- Alternatively, you can specify the path to the SRA Toolkit as a command-line argument:
  ```bash
  --SRATOOLS_PATH=/your/path/to/SRAToolkit/
-If the executables are in your $PATH variable, BRAKER can also try to guess their location automatically.

# HISAT2
-If you want to use unaligned RNA-Seq reads, the HISAT2 software is required to map them to the genome. A precompiled version of HISAT2 can be downloaded from the following link:

-Download HISAT2: http://daehwankimlab.github.io/hisat2/download/#version-hisat2-221

# Usage with BRAKER
-BRAKER will attempt to locate the HISAT2 executables (hisat2, hisat2-build) using the environment variable $HISAT2_PATH.

-Alternatively, you can specify the path to HISAT2 as a command-line argument:

```bash
--HISAT2_PATH=/your/path/to/HISAT2/
```
-If the executables are in your $PATH variable, BRAKER can also try to guess their location automatically.

-This Markdown provides a clear guide for downloading and using the SRA Toolkit and HISAT2 with BRAKER.
