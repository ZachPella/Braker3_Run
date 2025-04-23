library(ggplot2)

# Load example GO term counts
go_data <- read.csv("topGO_BP_results.csv")

ggplot(go_data, aes(x=reorder(Term, -Significant), y=Significant)) +
  geom_bar(stat="identity") +
  coord_flip() +
  xlab("GO Term") + ylab("Significant Genes") +
  ggtitle("Top 10 GO BP Terms") +
  theme_minimal() +
  ggsave("top10_go_bp_terms.pdf")

