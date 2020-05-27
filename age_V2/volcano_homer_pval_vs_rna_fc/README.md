To make the volcano files start with :

1) RNA_transformed_tpm_minus_sva_contribs.tfs.txt
SVM-corrected TPM values for genes with known TF behavior.
2) homer.motifs.of.interest
These are homer motifs with significan de novo p-values
The mapping of TF name to TF family can be found from: "tf_to_family_map.txt"

execute "aggregate_for_plot.py" to form volcano plot inputs
execute "plot_volcano.R" to plot the volcano plots.
