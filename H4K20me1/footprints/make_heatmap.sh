computeMatrix reference-point --samplesLabel "Aged" "Young" \
	      -p 50 \
	      -S 5p.counts.Old.bw  5p.counts.Young.bw \
	      -R Merged.tss.near.peaks.bed \
	      -o h4k20me1.mat.gz \
	      --upstream 5000 \
	      --downstream 5000

plotHeatmap --colorMap RdBu --zMin 0 --zMax 0.075 -m h4k20me1.mat.gz -out h4k20me1.svg 
