#!/bin/bash
#Satellite cells
python form_heatmap_inputs.py --inputf ../gene_lists/wt_vs_ko_sat/differential_genes_Day7SatWT_vs_Day7SatKO.tsv ../gene_lists/wt_vs_ko_sat/differential_genes_Day2SatWT_vs_Day2SatKO.tsv ../gene_lists/wt_vs_ko_sat/differential_genes_Day0SatWT_vs_Day0SatKO.tsv ../gene_lists/wt_vs_ko_sat/differential_genes_Day4SatWT_vs_Day4SatKO.tsv --outf heatmap_inputs_sat.txt

#Macrophages
python form_heatmap_inputs.py --inputf ../gene_lists/wt_vs_ko_mac/differential_genes_Day7MacWT_vs_Day7MacKO.tsv ../gene_lists/wt_vs_ko_mac/differential_genes_Day2MacWT_vs_Day2MacKO.tsv ../gene_lists/wt_vs_ko_mac/differential_genes_Day0MacWT_vs_Day0MacKO.tsv ../gene_lists/wt_vs_ko_mac/differential_genes_Day4MacWT_vs_Day4MacKO.tsv --outf heatmap_inputs_mac.txt

#Combination of satellite cells and macrophages
python form_heatmap_inputs.py --inputf ../gene_lists/wt_vs_ko_sat/differential_genes_Day7SatWT_vs_Day7SatKO.tsv ../gene_lists/wt_vs_ko_sat/differential_genes_Day2SatWT_vs_Day2SatKO.tsv ../gene_lists/wt_vs_ko_sat/differential_genes_Day0SatWT_vs_Day0SatKO.tsv ../gene_lists/wt_vs_ko_sat/differential_genes_Day4SatWT_vs_Day4SatKO.tsv ../gene_lists/wt_vs_ko_mac/differential_genes_Day7MacWT_vs_Day7MacKO.tsv ../gene_lists/wt_vs_ko_mac/differential_genes_Day2MacWT_vs_Day2MacKO.tsv ../gene_lists/wt_vs_ko_mac/differential_genes_Day0MacWT_vs_Day0MacKO.tsv ../gene_lists/wt_vs_ko_mac/differential_genes_Day4MacWT_vs_Day4MacKO.tsv --outf heatmap_inputs_sat_mac.txt



