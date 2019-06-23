For read trimming, alignment with STAR, and quantification with RSEM, the needed scripts are on the workstation, here: 
/opt/rna_seq_pipeline

Run them in this order on your fastq datasets: 


trim_rna_trimmomatic.sh -- I recommend trimming to 50 bp length 



map_rna_star.sh (for paired end data) or map_rna_star_single_end.sh (for single end data). 

The corresponding STAR index for mouse is here: /data/mm10/star 

If you need to align against a different species, you can run the script: build_index_star.sh



quant_rna_rsem.sh (for paired end) or quant_rna_rsem_single_end.sh (for single end)

The corresponding RSEM index for mouse is here: /data/mm10/rsem
If you need to build an RSEM index for another species, you can run the script build_index_rsem.sh


Once you have run these scripts, you will have RSEM quantified FPKM, TPM information for genes and isoforms. 
You can aggregate the RSEM files for the individual datasets using this script: 
/media/drive1/annashch/nobel_lab_projects/age/v1/aggregate_rsem.py



This will give you a matrix with genes or isoforms in the rows and the replicates in the columns, the values will be either TPM or FPKM. 


You will probably also want to generate browser tracks for your dataset. To do this, you want to merge the bam files for the individual RNA-seq replicates for a given sample, index the merged bam file, and then run the bamCoverage command. An example on how to do this is here: 
/media/drive1/annashch/nobel_lab_projects/age/v2/rna_tracks/generate_bigwigs.d0.Aged.sh



Next steps are PCA and differential gene expression analysis. 
An example script for how to run PCA and differential expression analysis with SVA and limma is here: /media/drive1/annashch/nobel_lab_projects/age/v1/pca/pca_rna.R
