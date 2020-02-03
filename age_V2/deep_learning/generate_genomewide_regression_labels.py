from seqdataloader.labelgen import *

regression_params={
    'task_list':"tasks.tsv",
    'outf':"age.regressionlabels.all_genome_bins_regression.hdf5",
    'output_type':'hdf5',
    'chroms_to_keep':['chr1','chr2','chr3','chr4','chr5','chr6','chr7','chr8','chr9','chr10','chr11','chr12','chr13','chr14','chr15','chr16','chr17','chr18','chr19','chrX','chrY'],
    'chrom_sizes':'mm10.chrom.sizes',
    'bin_stride':50,
    'left_flank':400,
    'right_flank':400,
    'bin_size':200,
    'task_threads':10,
    'chrom_threahds':4,
    'labeling_approach':'all_genome_bins_regression',
    'allow_ambiguous':True}

genomewide_labels(regression_params)
