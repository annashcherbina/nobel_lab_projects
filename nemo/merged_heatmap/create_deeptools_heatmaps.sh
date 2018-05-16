
#run compute matrix to collect the data needed for plotting
#computeMatrix scale-regions -S NEMO.fc.bigwig Control.fc.bigwig IKK.fc.bigwig \
#          -R AP1.bed CTCF.bed AP4.bed NFKB.bed RUNX1.bed \
#          --beforeRegionStartLength 1000 \
#          --regionBodyLength 80 \
#          --afterRegionStartLength 1000 \
#          --skipZeros -o enriched.tfs.mat.gz \
#          -bs 5
#plotHeatmap -m enriched.tfs.mat.gz \
#            -out EnrichedTFHeatmap.png
#


#run compute matrix to collect the data needed for plotting
computeMatrix scale-regions -S NEMO.fc.bigwig Control.fc.bigwig IKK.fc.bigwig \
          -R AP1.filtered.bed CTCF.filtered.bed AP4.filtered.bed NFKB.filtered.bed RUNX1.filtered.bed \
          --beforeRegionStartLength 1000 \
          --regionBodyLength 80 \
          --afterRegionStartLength 1000 \
          --skipZeros -o enriched.tfs.filtered.mat.gz \
          -bs 5
plotHeatmap -m enriched.tfs.filtered.mat.gz \
            -out EnrichedTFHeatmap.filtered.png
