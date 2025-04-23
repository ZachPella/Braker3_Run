library(ggplot2)

df <- read.csv("sig_DE_Female_vs_L3.csv")
df$color <- ifelse(df$logFC > 1, "Up in Female",
             ifelse(df$logFC < -1, "Up in L3", "Not Sig"))

ggplot(df, aes(x=logFC, y=-log10(FDR), color=color)) +
  geom_point(alpha=0.6) +
  theme_minimal() +
  scale_color_manual(values=c("red", "blue", "gray")) +
  ggtitle("Volcano Plot: Female vs L3") +
  ggsave("volcano_female_vs_l3.pdf")

