## Install packages from Bioconductor
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install(version = "3.16")


if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}
BiocManager::install(c(
  "recount", "GenomicRanges", "limma", "edgeR", "DESeq2",
  "regionReport", "clusterProfiler", "org.Hs.eg.db", "gplots",
  "derfinder", "GenomicState", "bumphunter", "derfinderPlot", "sessioninfo"
))

library("recount")
library("GenomicRanges")
library("limma")
library("edgeR")
library("DESeq2")
library("regionReport")
library("clusterProfiler")
library("org.Hs.eg.db")
library("gplots")
library("derfinder")
library("GenomicState")
library("bumphunter")
library("derfinderPlot")
library("sessioninfo")
library("ggplot2")
library("dplyr")


#do DEG analysis

abstract_search("human brain development by age") #find SRA project ID. SRP045638


if (!file.exists(file.path("SRP045638", "rse_gene.Rdata"))) {
  download_study("SRP045638", type = "rse-gene") #download project
}

file.exists(file.path("SRP045638", "rse_gene.Rdata")) #check that it's downloaded


load(file.path("SRP045638", "rse_gene.Rdata")) #load the data into envirnment

dim(colData(rse_gene)) #72x21
colnames(colData(rse_gene))

colData(rse_gene)[ ,
  c("read_count_as_reported_by_sra", "reads_downloaded")
]

summary(
  colData(rse_gene)$proportion_of_reads_reported_by_sra_downloaded
)

head(colData(rse_gene)$auc) #AUC info used by scale_counts() by default


colData(rse_gene)[, c(
  "mapped_read_count", "paired_end",
  "avg_read_length"
)]


rse_gene <- add_predictions(rse_gene) #adds in predicted phenotypes like sex

dim(colData(rse_gene)) #72x33 

colData(rse_gene)[, 22:ncol(colData(rse_gene))] #shows the predicted phenotypes added










