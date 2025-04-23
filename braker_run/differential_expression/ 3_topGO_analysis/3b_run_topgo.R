library(topGO)

args <- commandArgs(trailingOnly=TRUE)
indir <- args[1]

geneID2GO <- readMappings(file=paste0(indir, "/gene2go.txt"))
geneNames <- names(geneID2GO)
geneList <- factor(as.integer(geneNames %in% readLines(paste0(indir, "/sig_gene_ids.txt"))))
names(geneList) <- geneNames

GOdata <- new("topGOdata", ontology = "BP", allGenes = geneList,
              annot = annFUN.gene2GO, gene2GO = geneID2GO)

resultFisher <- runTest(GOdata, algorithm = "classic", statistic = "fisher")
allRes <- GenTable(GOdata, classicFisher = resultFisher, orderBy = "classicFisher", topNodes = 10)

write.csv(allRes, file=paste0(indir, "/topGO_BP_results.csv"))

