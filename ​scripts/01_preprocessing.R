# Single-Cell Ovary Analysis
# Step 1: Preprocessing
# Author: Riwaz Sangroula

library(Seurat)

# Inspect the Seurat object
ovary1

# Normalize gene expression data
ovary1 <- NormalizeData(ovary1)

# Identify highly variable genes
ovary1 <- FindVariableFeatures(
  ovary1,
  selection.method = "vst",
  nfeatures = 2000
)

# Inspect the updated object
ovary1
