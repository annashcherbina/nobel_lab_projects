python aggregate_diff_gene_df.py --diff_gene_files diff_d0_Y_vs_A.tsv diff_d1_Y_vs_A.tsv diff_d3_Y_vs_A.tsv diff_d5_Y_vs_A.tsv diff_d7_Y_vs_A.tsv \
       --corrected_tpm_values ATAC_transformed_tpm_minus_sva_contribs.txt \
       --out_averaged diff_peaks_reps_averaged.tsv \
       --out_fold_change diff_peaks_reps_average_fc_young_vs_aged.tsv
