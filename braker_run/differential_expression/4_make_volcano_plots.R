#!/bin/bash
#SBATCH --time=1:00:00
#SBATCH --mem=16G
#SBATCH --job-name=volcano_plot
#SBATCH --output=volcano_plot.%j.out
#SBATCH --error=volcano_plot.%j.err
#SBATCH --cpus-per-task=2

module load R

WORK_DIR="/work/fauverlab/zachpella"
SCRIPT_DIR="$WORK_DIR/scripts"
OUTPUT_DIR="$WORK_DIR/braker_run/expression_analysis"

mkdir -p $SCRIPT_DIR

cat > $SCRIPT_DIR/volcano_plot_adult_vs_L3.R << 'EOF'
#!/usr/bin/env Rscript

library(edgeR)
library(ggplot2)

setwd("/work/fauverlab/zachpella/braker_run/expression_analysis")

# Read raw counts
counts_raw <- read.table("gene_counts.txt", header=TRUE, sep="\t", skip=1)
gene_ids <- counts_raw$Geneid
counts <- counts_raw[, 7:9]
colnames(counts) <- c("Female_Adult", "Male_Adult", "L3")
rownames(counts) <- gene_ids

# Remove genes with all zero counts
counts <- counts[rowSums(counts) > 0, ]

# Build group info: Adult = 0, L3 = 1
group <- factor(c("Adult", "Adult", "L3"))
design <- model.matrix(~ group)

# edgeR differential expression
dge <- DGEList(counts = counts, group = group)
dge <- calcNormFactors(dge)
dge <- estimateDisp(dge, design)
fit <- glmFit(dge, design)
lrt <- glmLRT(fit, coef=2)
results <- topTags(lrt, n=Inf)$table
results$GeneID <- rownames(results)

# Volcano plot
results$logFDR <- -log10(results$FDR)
results$sig <- ifelse(results$FDR < 0.05 & abs(results$logFC) > 1, "Significant", "Not Significant")

pdf("volcano_plot_adult_vs_L3.pdf", width=8, height=8)
ggplot(results, aes(x=logFC, y=logFDR, color=sig)) +
  geom_point(alpha=0.6) +
  scale_color_manual(values=c("gray70", "#D95F02")) +
  geom_vline(xintercept=c(-1,1), linetype="dashed", color="black") +
  geom_hline(yintercept=-log10(0.05), linetype="dashed", color="black") +
  labs(title="Volcano Plot: Adult vs L3",
       x="Log2 Fold Change (Adult vs L3)",
       y="-Log10 FDR") +
  theme_minimal() +
  theme(legend.title=element_blank())
dev.off()

cat("✅ Volcano plot saved: volcano_plot_adult_vs_L3.pdf\n")
EOF

chmod +x $SCRIPT_DIR/volcano_plot_adult_vs_L3.R

cd $OUTPUT_DIR
Rscript $SCRIPT_DIR/volcano_plot_adult_vs_L3.R

echo "✅ Volcano plot generation complete."
