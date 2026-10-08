library(Seurat)

# Create local data directory
dir.create("data", showWarnings = FALSE)

# Download public GEO dataset
url <- "https://ftp.ncbi.nlm.nih.gov/geo/series/GSE131nnn/GSE131971/suppl/GSE131971_RAW.tar"
tarfile <- "data/GSE131971_RAW.tar"

options(timeout = 600)

if (!file.exists(tarfile)) {
  download.file(url, tarfile, mode = "wb")
}

# Extract files
dir.create("data/GSE131971", showWarnings = FALSE)

untar(
  tarfile,
  exdir = "data/GSE131971"
)

# Find files belonging to GSM3832978
files <- list.files(
  "data/GSE131971",
  recursive = TRUE,
  full.names = TRUE
)

sample1_files <- files[grepl("GSM3832978", files)]

matrix_file <- sample1_files[
  grepl("matrix.*\\.mtx(\\.gz)?$", sample1_files, ignore.case = TRUE)
]

barcode_file <- sample1_files[
  grepl("barcodes.*\\.tsv(\\.gz)?$", sample1_files, ignore.case = TRUE)
]

feature_file <- sample1_files[
  grepl("(genes|features).*\\.tsv(\\.gz)?$", sample1_files, ignore.case = TRUE)
]

# Read count matrix
counts1 <- ReadMtx(
  mtx = matrix_file,
  cells = barcode_file,
  features = feature_file,
  feature.column = 2
)

# Create Seurat object
ovary1 <- CreateSeuratObject(
  counts = counts1,
  project = "GSM3832978"
)

ovary1
