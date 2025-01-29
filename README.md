**🦠 Braker3 Genome Adventure: Annotate a Hookworm Genome! 🧬**  

Hi there! This guide will help you use Braker3 (a cool detective tool 🕵️) to find genes in a hookworm’s DNA. Think of it like solving a puzzle where Braker3 is your detective friend!  

---

### **📦 What You Need**  
1. **Your Tools**:  
   - **A Magic Box (Singularity)**: This keeps all your tools organized. You need to install it!  
   - **Computer Power**: A laptop or big computer (like a scientist’s!).  

2. **Inputs (Your Clues)**:  
   - **Hookworm DNA Map** (`necator_genome.fa`): A file with the hookworm’s DNA code.  
   - **Protein Clues** (`protein_db.fa`): A file of known proteins (like puzzle pieces!).  
   - **RNA Clues**: Either:  
     - **BAM Files** (like `rnaseq1.bam`): These show how the DNA is read by the worm’s cells.  
     - **SRA IDs** (like `SRR_ID1`): Secret codes to download RNA data from the internet!  

---

### **🚀 Step-by-Step Instructions**  

#### **Step 1: Set Up Your Magic Box (Singularity)**  
**Goal**: Get Braker3 ready in a magic box!  
```bash  
singularity build braker3.sif docker://teambraker/braker3:latest  
```  
*What happens?*: This downloads Braker3 into a "magic box" called `braker3.sif`!  

---

#### **Step 2: Start the Detective Work!**  
**Goal**: Find genes in the hookworm’s DNA using Braker3.  

**If you have BAM files (RNA clues)**:  
```bash  
singularity exec braker3.sif braker.pl \  
    --genome=necator_genome.fa \  
    --prot_seq=protein_db.fa \  
    --bam=rnaseq1.bam,rnaseq2.bam \  
    --species=necator_americanus  
```  

**If you have SRA IDs (secret codes)**:  
```bash  
singularity exec braker3.sif braker.pl \  
    --genome=necator_genome.fa \  
    --prot_seq=protein_db.fa \  
    --rnaseq_sets_ids=SRR_ID1,SRR_ID2 \  
    --species=necator_americanus  
```  

*What happens?*: Braker3 combines the DNA map, protein clues, and RNA clues to guess where the genes are!  

---

### **📂 What’s Inside This Project?**  
**Folders and Files**:  
```  
braker_run/  
├── braker_directories/          📚 Recipe books for setting up tools!  
│   ├── Download_Augustus.md     (How to get AUGUSTUS, a gene-finder)  
│   ├── Download_GeneMark.md     (How to get GeneMark, another gene-finder)  
├── genomes/                     🧬 Home for your hookworm DNA map!  
├── post_braker/                 🔍 More detective work after Braker3 finishes!  
│   ├── blast_analysis/          🔎 BLAST: Tag genes with names!  
│   ├── busco_analysis/          ✔️ BUSCO: Check if genes are complete!  
│   ├── interproscan_analysis/   🧩 InterProScan: Find out what genes DO!  
│   └── orthofinder_analysis/    🌍 OrthoFinder: See which genes are in other species!  
```  

---

### **🎁 What You’ll Get (Outputs!)**  
1. **Gene Map** (`braker.gtf`): A list of all the genes Braker3 found!  
2. **Protein Recipes** (`braker.aa`): Recipes for proteins the genes make!  
3. **Gene Pictures** (`pca_results.pdf`): Rainbow-colored graphs showing gene groups!  

---

### **🔍 After Braker3: More Fun!**  
Run these scripts in the `post_braker/` folder:  

1. **BLAST Adventure**:  
   ```bash  
   ./run_blast.sh  
   ```  
   *What happens?*: BLAST gives funny names to your genes (like "Super Oxygen Maker!").  

2. **BUSCO Check**:  
   ```bash  
   ./run_busco.sh  
   ```  
   *What happens?*: BUSCO makes a report card to see if you found all the genes!  

3. **InterProScan Quest**:  
   ```bash  
   ./run_interproscan.sh  
   ```  
   *What happens?*: Learn what your genes DO (like "this gene helps the worm breathe!").  

---

### **⚠️ Troubleshooting Tips**  
- **BAM files need XS tags**: Tell your RNA aligner to add these (use `--dta` for HISAT2 or `--outSAMstrandField` for STAR).  
- **Permission errors**: Ask a grown-up to check if you can write to the AUGUSTUS folder.  
- **Log files**: If Braker3 is stuck, check the `braker.log` file for clues!  

---

### **🌟 Credits**  
- **Braker3 Team**: [Docker Hub](https://hub.docker.com/r/teambraker/braker3)  
- **GeneMark-ETP**: [GitHub](https://github.com/Gaius-Augustus/GeneMark-ETP)  
- **AUGUSTUS**: [GitHub](https://github.com/Gaius-Augustus/AUGUSTUS)  

---

**You did it!** Now you’re a genome detective! 🎉 Share your gene maps and protein recipes with the world!  

*Note: Grown-ups might need to help install Singularity or fix permissions!* 😊
