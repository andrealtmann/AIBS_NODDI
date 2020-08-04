#! /home/aaltmann/bin/R-3.6.2/bin/Rscript
## /usr/local/bin/Rscript
#This is a wrapper script for spatial_statistics.R

possible_samples <- c("H0351_1009", "H0351_1012", "H0351_1015", "H0351_1016", "H0351_2001", "H0351_2002")
possible_ftd_genes <- c("FA","MD", "DAb", "ODIp", "ODIs", "ODItot", "ODIWN", "Vin", "VinWN", "Viso", "VisoWN")

dsource <- "CT"

remotely <- T
sid <- ""

#read comman line
args = commandArgs(trailingOnly=TRUE)
for (ar in args){
  tok = strsplit(ar, split="=")[[1]]

  if (tok[1] == "--feat"){
    if (is.element(tok[2], possible_ftd_genes)){
      ftd_gene <- tok[2]
    } else {
       message("feature ", tok[2], " is not a valid option.")
       q("no",status=-1)
    }
  }

  if (tok[1] == "--subj"){
    if (is.element(tok[2], possible_samples)){
      sid <- tok[2]
    } else {
       message("subjectID '", tok[2], "' is not a valid option.")
       q("no",status=-1)
    }
  }
}

source("./spatial_statistics_SSMI.R")
