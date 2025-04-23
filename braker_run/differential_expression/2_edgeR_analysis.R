#!/usr/bin/env Rscript

library(edgeR)

counts <- read.table("gene_counts.txt", header=TRUE, skip=1, row.names=1)
counts <- counts[,6:8]
colnames(counts) <- c("Female", "Male", "L3")

dge <- DGEList(counts=counts)
dge <- dge[rowSums(cpm(dge) > 1) >= 1, , keep.lib.sizes=FALSE]
dge <- calcNormFactors(dge)
disp <- 0.4

runDE <- function(dge, group1, group2, disp) {
  idx <- which(colnames(dge) %in% c(group1, group2))
  design <- model.matrix(~factor(colnames(dge)[idx]))
  colnames(design) <- c("Intercept", group1)

  fit <- glmFit(dge[,idx], design, dispersion=disp)
  lrt <- glmLRT(fit)
  res <- topTags(lrt, n=nrow(dge), sort.by="PValue")$table
  res$comparison <- paste(group1, "vs", group2)

  sig <- res[res$FDR < 0.05 & res$PValue < 0.05, ]
  write.csv(sig, paste0("sig_DE_", group1, "_vs_", group2, ".csv"))
  write.csv(sig[sig$logFC > 0, ], paste0("up_in_", group1, "_vs_", group2, ".csv"))
  write.csv(sig[sig$logFC < 0, ], paste0("up_in_", group2, "_vs_", group1, ".csv"))
}

runDE(dge, "Male", "Female", disp)
runDE(dge, "Male", "L3", disp)
runDE(dge, "Female", "L3", disp)

