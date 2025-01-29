**🚀 BRAKER3 Singularity Adventure: Build and Run! 🧬**  

Hi there! This guide will help you use BRAKER3 (a super cool gene-finding tool 🕵️) inside a magic box called Singularity. Think of Singularity as a lunchbox that holds all your tools neatly so you can take them anywhere!  

---

### **📦 What You Need**  
1. **Your Tools**:  
   - **Singularity**: A magic lunchbox for your tools. Ask a grown-up to install it!  
   - **Computer Power**: A laptop or big computer (like a scientist’s!).  

2. **Inputs (Your Clues)**:  
   - **Genome File** (`genome.fa`): A file with the DNA code of your organism.  
   - **BAM File** (`alignment.bam`): A file showing how the DNA is read by the organism’s cells.  
   - **Species Name** (`myspecies`): The name of your organism (like "hookworm" or "fruit fly").  

---

### **🚀 Step-by-Step Instructions**  

#### **Step 1: Get Your Magic Lunchbox (Install Singularity)**  
**Goal**: Install Singularity so you can use BRAKER3.  
- Follow the official guide: [Singularity Installation](https://sylabs.io/guides/3.0/user-guide/installation.html).  
- *What happens?*: You’ll have a magic lunchbox ready to hold BRAKER3!  

---

#### **Step 2: Build Your Magic Lunchbox (Singularity Image)**  
**Goal**: Put BRAKER3 inside your magic lunchbox!  
```bash  
singularity build braker3.sif docker://teambraker/braker3:latest  
```  
*What happens?*:  
- `singularity build`: Builds the lunchbox.  
- `braker3.sif`: The name of your lunchbox file.  
- `docker://teambraker/braker3:latest`: The recipe for BRAKER3 (from the internet!).  

---

#### **Step 3: Open Your Lunchbox and Run BRAKER3!**  
**Goal**: Use BRAKER3 to find genes in your DNA.  

**Basic Command**:  
```bash  
singularity exec braker3.sif braker.pl  
```  
*What happens?*:  
- `singularity exec`: Opens the lunchbox and runs a command.  
- `braker3.sif`: Your magic lunchbox.  
- `braker.pl`: The BRAKER3 tool inside the lunchbox.  

**Example Command (With Your Files)**:  
```bash  
singularity exec braker3.sif braker.pl --genome=genome.fa --bam=alignment.bam --species=myspecies  
```  
*What happens?*:  
- BRAKER3 uses your DNA map (`genome.fa`), RNA clues (`alignment.bam`), and species name (`myspecies`) to find genes!  

---

### **📂 What’s Inside Your Lunchbox?**  
- **BRAKER3**: A gene-finding detective!  
- **Your Files**: The genome, BAM file, and species name are automatically available inside the lunchbox.  

---

### **🎁 What You’ll Get (Outputs!)**  
1. **Gene Map** (`braker.gtf`): A list of all the genes BRAKER3 found!  
2. **Protein Recipes** (`braker.aa`): Recipes for proteins the genes make!  
3. **Gene Pictures**: Rainbow-colored graphs showing gene groups!  

---

### **⚠️ Troubleshooting Tips**  
- **Missing Files**: Make sure your `genome.fa` and `alignment.bam` files are in the right place!  
- **Permissions**: Ask a grown-up to check if you can write to the folder.  
- **Log Files**: If BRAKER3 is stuck, check the `braker.log` file for clues!  

---

### **🌟 Credits**  
- **BRAKER3 Team**: [Docker Hub](https://hub.docker.com/r/teambraker/braker3)  
- **Singularity Docs**: [Singularity Installation](https://sylabs.io/guides/3.0/user-guide/installation.html)  

---

**You did it!** Now you’re a gene-finding wizard! 🎉 Share your gene maps and protein recipes with the world!  

*Note: Grown-ups might need to help install Singularity or fix permissions!* 😊
