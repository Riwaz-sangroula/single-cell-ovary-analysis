# Scale the data
ovary1 <- ScaleData(ovary1)

# Run PCA using variable features
ovary1 <- RunPCA(
  ovary1,
  features = VariableFeatures(ovary1)
)

# Check PCA results
print(ovary1[["pca"]], dims = 1:5, nfeatures = 5)

# View elbow plot
ElbowPlot(ovary1)
