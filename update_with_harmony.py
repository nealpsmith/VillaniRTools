if __name__ == "__main__" :
	import pandas as pd
	import pegasus as pg
	import argparse

	parser = argparse.ArgumentParser(description='Update the X_pca with the results of harmony')
	parser.add_argument('h5ad_filename', type=str)
	parser.add_argument('harmony_csv', type=str)
	parser.add_argument('output', type=str)

	args = parser.parse_args()
	args = args.__dict__

	pca = pd.read_csv(args["harmony_csv"])
	pca = pca.values.T[1:] # remove the id pf the pc
	
	adata = pg.read_input(args["h5ad_filename"])
	adata.obsm["X_pca"] = pca
	pg.write_output(adata, args["output"])
