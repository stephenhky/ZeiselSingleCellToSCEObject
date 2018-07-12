
library(SummarizedExperiment)
library(SingleCellExperiment)

# loading original data
download.file('https://storage.googleapis.com/linnarsson-lab-www-blobs/blobs/cortex/expression_mRNA_17-Aug-2014.txt',
              './expression_mRNA_17-Aug-2014.txt')
zeisel.oridata<- read.csv('expression_mRNA_17-Aug-2014.txt',
                          header = TRUE,
                          sep = '\t',
                          quote = "",
                          stringsAsFactors = FALSE)

# getting gene names
gene_names<- zeisel.oridata[11:nrow(zeisel.oridata), 1]

# data wrangling
num_rows<- length(c(11:nrow(zeisel.oridata)))
num_cols<- length(c(3:ncol(zeisel.oridata)))

zeisel.fulldata<- matrix(as.numeric(as.matrix(zeisel.oridata[11:nrow(zeisel.oridata), 3:ncol(zeisel.oridata)])), 
                         num_rows, num_cols)

# getting cell types
cell_types<- unlist(zeisel.oridata[8,][3:(dim(zeisel.oridata)[2])])


# creating single-cell experiment object
zeisel.sce<- SingleCellExperiment(
  assays = list(counts=zeisel.fulldata,
                logcounts=log2(zeisel.fulldata+1)
                )
)
rownames(zeisel.sce)<- gene_names
colnames(zeisel.sce)<- unname(unlist(zeisel.oridata[7, 3:3007]))
zeisel.sce$cell_type<- unname(cell_types)

# further wrangling
rowData(zeisel.sce)$feature_symbol<- rownames(zeisel.sce)
zeisel.sce<- zeisel.sce[!duplicated(rowData(zeisel.sce)$feature_symbol), ]

# define spike-ins
isSpike(zeisel.sce, "ERCC") <- grepl("ERCC", rowData(zeisel.sce)$feature_symbol)

file.remove('./expression_mRNA_17-Aug-2014.txt')
saveRDS(zeisel.sce, 'Target/zeisel_dataset_sce.rds')
