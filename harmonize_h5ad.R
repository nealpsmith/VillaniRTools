#!/usr/bin/env Rscript
library(rhdf5)
library(harmony)
require(docopt)

'Usage:
   harmonize_h5ad.R [--help --h5 <h5ad> --var <var> --output <output>]

Options:
   --h5 h5ad that contains the PCs to be harmonized
   --var variable to harmonize on (i.e the batch)
   --output output file to save harmonized PCs
 ]' -> doc
opts <- docopt(doc)

# Get the h5 file path
h5_file <- opts$h5

# Get the observations from the h5
obs <- h5read(h5_file, "obs")

if(!(opts$var %in% colnames(obs))) {
	stop("variable to correct on not in obs")
}

# Get the PCA and transpose it
pca <- t(h5read(h5_file, "obsm/X_pca"))


set.seed(42)

harmonized <- HarmonyMatrix(
data_mat = pca,
meta_data = obs,
vars_use = opts$var,
do_pca = FALSE,
verbose = FALSE
)

write.csv(t(harmonized), file = opts$output)
