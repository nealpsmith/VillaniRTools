h5ad=$1
var=$2
harmony_out=$3
final_h5ad=$4

echo "Running Rscript harmonize_h5ad --h5 $h5ad --var $var --output $harmony_out..."
Rscript harmonize_h5ad --h5 $h5ad --var $var --output $harmony_out
echo "python update_with_harmony.py $h5ad $harmony_out $final_h5ad..."
python update_with_harmony.py $h5ad $harmony_out $final_h5ad
