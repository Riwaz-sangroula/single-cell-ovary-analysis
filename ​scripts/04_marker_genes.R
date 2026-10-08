# Single-Cell Ovary Analysis
# Step 4: Marker Gene Analysis
# Author: Riwaz Sangroula

library(Seurat)

# Identify marker genes for each cluster
markers <- FindAllMarkers(
  ovary1,
  only.pos = TRUE,
  min.pct = 0.25,
  logfc.threshold = 0.25
)

# View marker gene results
head(markers)
