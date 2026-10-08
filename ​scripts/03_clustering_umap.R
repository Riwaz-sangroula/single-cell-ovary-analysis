# Single-Cell Ovary Analysis
# Step 3: Clustering and UMAP
# Author: Riwaz Sangroula

library(Seurat)

# Find nearest neighbors
ovary1 <- FindNeighbors(ovary1, dims = 1:10)

# Cluster cells
ovary1 <- FindClusters(ovary1, resolution = 0.5)

# Run UMAP
ovary1 <- RunUMAP(ovary1, dims = 1:10)

# Visualize clusters
DimPlot(ovary1, reduction = "umap", label = TRUE)
