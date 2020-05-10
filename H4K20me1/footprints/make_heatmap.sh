computeMatrix reference-point --samplesLabel "Aged" "Young" \
	      -p 50 \
	      -S 5p.counts.Old.bw  5p.counts.Young.bw \
	      -R common.bed young.only.bed old.only.bed \
	      -o h4k20me1.mat.gz \
	      --upstream 5000 \
	      --downstream 5000 \
	      --binSize 20 \
	      --averageTypeBins max

plotHeatmap --colorMap RdBu --regionsLabel "Shared" "Young Only" "Aged Only"  -m h4k20me1.mat.gz -out h4k20me1.svg -min 0 -max 5 --heatmapHeight 10 --legendLocation best



