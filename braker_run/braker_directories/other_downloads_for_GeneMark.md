# StringTie2

-StringTie2 is used by **GeneMark-ETP** to assemble aligned RNA-Seq alignments. A precompiled version of StringTie2 can be downloaded from the official website:

- **Download StringTie2**: [https://ccb.jhu.edu/software/stringtie/#install](https://ccb.jhu.edu/software/stringtie/#install)

---

# BEDTools

-The **bedtools** software package is required by **GeneMark-ETP** if you want to run **BRAKER** with both RNA-Seq and protein data. You can download **bedtools** from the following link:

- **Download BEDTools**: [https://github.com/arq5x/bedtools2/releases](https://github.com/arq5x/bedtools2/releases)

### Installation Options

1. **Precompiled Binary**:
   ```bash
   wget https://github.com/arq5x/bedtools2/releases/download/v2.30.0/bedtools.static.binary
   mv bedtools.static.binary bedtools
   chmod a+x bedtools
      ```
   
## Compile from Source:

   ```bash
wget https://github.com/arq5x/bedtools2/releases/download/v2.30.0/bedtools-2.30.0.tar.gz
tar -zxvf bedtools-2.30.0.tar.gz
cd bedtools2
make
   ```
-For more details, refer to the official documentation: https://bedtools.readthedocs.io/en/latest/content/installation.html

#GffRead
-GffRead is a utility software required by GeneMark-ETP. It can be downloaded and installed as follows:

-Download GffRead: https://github.com/gpertea/gffread/releases/download/v0.12.7/gffread-0.12.7.Linux_x86_64.tar.gz

## Installation Steps
   ```bash
wget https://github.com/gpertea/gffread/releases/download/v0.12.7/gffread-0.12.7.Linux_x86_64.tar.gz
tar xzf gffread-0.12.7.Linux_x86_64.tar.gz
cd gffread-0.12.7.Linux_x86_64
make
   ```
-This Markdown provides a clear and structured guide for downloading and installing the required tools for GeneMark-ETP.
