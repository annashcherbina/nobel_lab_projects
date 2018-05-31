for f in d0_Y_vs_d0_O  d5_O_vs_d3_O d1_O_vs_d0_O  d5_Y_vs_d3_Y d1_Y_vs_d0_Y  d5_Y_vs_d5_O d1_Y_vs_d1_O  d7_O_vs_d5_O d3_O_vs_d1_O  d7_Y_vs_d5_Y d3_Y_vs_d1_Y  d7_Y_vs_d7_O d3_Y_vs_d3_O
do
    #Rscript ../../utility/get_david_pathways.R names.differential_genes_$f.tsv.withname $f
    python ../../utility/get_david_name_map.py DAVID.$f    ../../Mus_musculus.GRCm38.87.ID.to.name
    #convert ENSEMBL ID to gene name 
done
