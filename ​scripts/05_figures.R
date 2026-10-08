library(Seurat)
library(ggplot2)

p_umap <- DimPlot(
  ovary1,
  reduction = "umap",
  label = TRUE
)

p_elbow <- ElbowPlot(ovary1)

dir.create("figures", showWarnings = FALSE)

ggsave(
  "figures/umap_clusters.png",
  plot = p_umap,
  width = 8,
  height = 6
)

ggsave(
  "figures/pca_elbow_plot.png",
  plot = p_elbow,
  width = 8,
  height = 6
)
