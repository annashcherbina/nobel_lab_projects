for sample in  d0_Y d1_A d1_Y d3_A d3_Y d5_A d5_Y d7_A d7_Y #d0_A
do
    zgrep "-" $sample.pooled.tagAlign.gz > $sample.neg.bed &
    zgrep -v "-" $sample.pooled.tagAlign.gz > $sample.pos.bed &
done
