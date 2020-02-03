#run compute matrix to collect the data needed for plotting
#computeMatrix scale-regions -S nemo.merged.pval.bigWig ikk.merged.pval.bigWig control.4.pval.bigWig \
#          -R AP1.filtered.bed CTCF.filtered.bed AP4.filtered.bed NFKB.filtered.bed RUNX1.filtered.bed \
#          --beforeRegionStartLength 1000 \
#          --regionBodyLength 80 \
#          --afterRegionStartLength 1000 \
#          --skipZeros -o enriched.tfs.filtered.mat.gz \
#          -bs 5

#computeMatrix scale-regions -S nemo.4.pval.bigWig nemo.5.pval.bigWig control.4.pval.bigWig control.2.pval.bigWig \
#              -R AP1.filtered.bed CTCF.filtered.bed KLF4.filtered.bed NRF1.filtered.bed SP1.filtered.bed AP4.filtered.bed ELK4.filtered.bed MYF6.filtered.bed NFKB.filtered.bed RUNX1.filtered.bed \
#          --beforeRegionStartLength 1000 \
#          --regionBodyLength 80 \
#          --afterRegionStartLength 1000 \
#          -o enriched.tfs.filtered.mat.gz \
#          -bs 5


plotHeatmap -m enriched.tfs.filtered.mat.gz \
            -out EnrichedTFHeatmap.filtered.svg \
	    --plotFileFormat svg \
	    --legendLocation best \
	    --perGroup
	    

#computeMatrix scale-regions -S nemo.4.pval.bigWig nemo.5.pval.bigWig control.4.pval.bigWig control.2.pval.bigWig \
#              -R AP1.filtered.bed CTCF.filtered.bed KLF4.filtered.bed NRF1.filtered.bed SP1.filtered.bed AP4.filtered.bed ELK4.filtered.bed MYF6.filtered.bed NFKB.filtered.bed RUNX1.filtered.bed \
#          -o enriched.tfs.filtered.mat.2.gz \
#          -bs 5


#plotHeatmap -m enriched.tfs.filtered.mat.2.gz \
#            -out EnrichedTFHeatmap.filtered.2.png
