**🦠 Braker3 Genome Adventure: Annotate a Hookworm Genome and Stage Differential Expression Analysis! 🧬**  

Hi there! This guide will help you use Braker3—a powerful tool for finding genes in DNA—to annotate a hookworm genome. No advanced bioinformatics knowledge is required!  

---

### **📦 What You’ll Need**  
1. **Tools to Install**:  
   - **Singularity**: A container platform to keep your tools organized. Install it from [Singularity Installation Guide](https://sylabs.io/guides/3.0/user-guide/installation.html).  
   - **Computer**: A laptop or server with enough memory and processing power.  

2. **Input Files**:  
   - **Hookworm Genome** (`necator_genome.fa`): A file containing the hookworm’s DNA sequence.  
   - **Protein Database** (`protein_db.fa`): A file of known protein sequences for comparison.  
   - **RNA Data**: Either:  
     - **BAM Files** (e.g., `rnaseq1.bam`): Aligned RNA sequencing data.  
     - **SRA IDs** (e.g., `SRR_ID1`): Accession codes to download RNA data from public databases.  

---

### **🚀 Step-by-Step Guide**  

#### **Step 1: Set Up Braker3 with Singularity**  
**Goal**: Install Braker3 in a Singularity container.  
```bash  
singularity build braker3.sif docker://teambraker/braker3:latest  
```  
*What Happens*: This creates a Singularity image (`braker3.sif`) containing Braker3 and its dependencies.  

---

#### **Step 2: Run Braker3 to Annotate the Genome**  
**Goal**: Identify genes in the hookworm genome using Braker3.  

**If you have BAM files (RNA data)**:  
```bash  
singularity exec braker3.sif braker.pl \  
    --genome=necator_genome.fa \  
    --prot_seq=protein_db.fa \  
    --bam=rnaseq1.bam,rnaseq2.bam \  
    --species=necator_americanus  
```  

**If you have SRA IDs (to download RNA data)**:  
```bash  
singularity exec braker3.sif braker.pl \  
    --genome=necator_genome.fa \  
    --prot_seq=protein_db.fa \  
    --rnaseq_sets_ids=SRR_ID1,SRR_ID2 \  
    --species=necator_americanus  
```  

*What Happens*: Braker3 combines the genome, protein database, and RNA data to predict gene locations and functions.  

---

### **📂 Project Structure Explained**  
```
braker_run/
├── braker3.sif                   # Singularity container
│
├── augustus_config/              # AUGUSTUS configuration
│
├── GeneMark-ETP/                     # GeneMark-ETP files
│   ├── gmes_petap.pl             # GeneMark executable
│   └── LICENSE                   # License file
│
├── genomes/                      # Genome files
│   └── trimmed_header_genome.fasta
│
├── proteins/                     # Protein reference files
│   └── necator_americanus.protein.fa
│
├── rnaseq/                       # RNA-seq datasets
│   └── fastq/                   # Sequencing reads
│
├── differential expression/                      
│   
├── post_braker/                  # Post-analysis workflows
│   ├── blast_analysis/           # Functional annotation
│   ├── busco_analysis/           # Genome completeness
│   ├── interproscan_analysis/    # Protein domain prediction
│   └── orthofinder_analysis/     # Comparative genomics
│
└── braker_directories/           # Documentation
   ├── Download_Augustus.md
   └── Download_GeneMark.md 
```  
---

### **📊 Expected Outputs**  
1. **Gene Predictions** (`braker.gtf`): A file listing all predicted genes and their locations.  
2. **Protein Sequences** (`braker.aa`): A file containing the amino acid sequences of predicted proteins.  
3. **Visualizations** (`pca_results.pdf`): Graphs showing relationships between gene groups.  

---

### **🔍 Post-Braker3 Analysis**  
Run these scripts in the `post_braker/` folder to further explore your results:  

1. **BLAST Analysis**:  
   ```bash  
   ./run_blast.sh  
   ```  
   *What Happens*: BLAST assigns functional annotations to your genes.  

2. **BUSCO Analysis**:  
   ```bash  
   ./run_busco.sh  
   ```  
   *What Happens*: BUSCO evaluates the completeness of your gene set.  

3. **InterProScan Analysis**:  
   ```bash  
   ./run_interproscan.sh  
   ```  
   *What Happens*: InterProScan predicts the biological functions of your genes.  

4. **Differential Expression Analysis**
- **Using Interproscan Results**: You need to run interproscan to do differential analysis. Interproscan gives you reactome pathways and go terms. This is all you need for differential analysis besides the feature counts and edgeR. Interproscan is what will link the actual gene names and the functional annotations. If you don't run interproscan you will not have any connection between functional annotaitons and gene names.   

---

### **⚠️ Troubleshooting Tips**  
- **BAM Files**: Ensure your BAM files include `XS` tags (use `--dta` in HISAT2 or `--outSAMstrandField` in STAR during alignment).  
- **Permissions**: Verify you have write access to the AUGUSTUS and GeneMark directories.  
- **Log Files**: Check `braker.log` for error messages if Braker3 fails.  

---

### **🌟 Credits**  
- **Braker3 Team**: [Docker Hub](https://hub.docker.com/r/teambraker/braker3)  
- **GeneMark-ETP**: [GitHub](https://github.com/Gaius-Augustus/GeneMark-ETP)  
- **AUGUSTUS**: [GitHub](https://github.com/Gaius-Augustus/AUGUSTUS)  

---

**Congratulations!** You’ve successfully annotated a hookworm genome. Share your findings with colleagues or explore other genomes using Braker3!  

*Note: Some steps (e.g., Singularity setup) may require assistance from your IT team.* 😊
