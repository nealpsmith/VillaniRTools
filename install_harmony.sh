conda_env=$1

echo "activating environement $conda_env..."
conda activate $conda_env

echo "installing dependencies..."
conda install r-base
conda install r-essentials
conda install r-devtools
conda install -c bioconda bioconductor-rhdf5
conda install -c anaconda r-docopt

echo "installing harmony..."
echo 'Sys.setenv(TAR = "/bin/tar");devtools::install_github("immunogenomics/harmony")' | R --no-save

