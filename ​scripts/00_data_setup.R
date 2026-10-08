# Single-Cell Ovary Analysis
# Data setup
# Author: Riwaz Sangroula

library(Seurat)

# Read Sample 1 10x gene-expression matrix
sample1 <- Read10X(
  data.dir = "GSE131971/sample1"
)

# Check matrix dimensions
dim(sample1)

# Create Seurat object
ovary1 <- CreateSeuratObject(
  counts = sample1,
  project = "ovary_sample1"
)

# Inspect object
ovary1
