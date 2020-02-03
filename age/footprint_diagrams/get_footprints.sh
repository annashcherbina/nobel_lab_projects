tf=$1
#run compute matrix to collect the data needed for plotting
computeMatrix scale-regions --samplesLabel "Day 0 Aged" "Day 1 Aged" "Day 3 Aged" "Day 5 Aged" "Day 7 Aged" "Day 0 Young" "Day 1 Young" "Day 3 Young" "Day 5 Young" "Day 7 Young" \
	      -p 20 \
	      -S /srv/www/kundaje/annashch/age/age_bigwig/MuSC_d0_Old_21K_R1_r1.PE2SE.nodup.tn5.pf.pval.signal.bigwig \
	      /srv/www/kundaje/annashch/age/age_bigwig/MuSC_d1_Old_10K_R1_r1.PE2SE.nodup.tn5_MuSC_d1_Old_10K_R2_r1.PE2SE.nodup.tn5.pf.pval.signal.bigwig \
	      /srv/www/kundaje/annashch/age/age_bigwig/MuSC_d3_Old_25K_R1_r1.PE2SE.nodup.tn5_MuSC_d3_Old_25K_R2_r1.PE2SE.nodup.tn5.pf.pval.signal.bigwig \
	      /srv/www/kundaje/annashch/age/age_bigwig/MuSC_d5_Old_10K_R1_r1.PE2SE.nodup.tn5_MuSC_d5_Old_10K_R2_r1.PE2SE.nodup.tn5.pf.pval.signal.bigwig \
	      /srv/www/kundaje/annashch/age/age_bigwig/MuSC_d7_Y_10K_R1_r1.PE2SE.nodup.tn5_MuSC_d7_Y_10K_R2_r1.PE2SE.nodup.tn5.pf.pval.signal.bigwig \
	      /srv/www/kundaje/annashch/age/age_bigwig/MuSC_d0_Y_10K_R2_r1.PE2SE.nodup.tn5.pf.pval.signal.bigwig \
	      /srv/www/kundaje/annashch/age/age_bigwig/MuSC_d1_Y_10K_R1_r1.PE2SE.nodup.tn5_MuSC_d1_Y_10K_R2_r1.PE2SE.nodup.tn5.pf.pval.signal.bigwig \
	      /srv/www/kundaje/annashch/age/age_bigwig/MuSC_d3_Y_25K_R1_r1.PE2SE.nodup.tn5_MuSC_d3_Y_25K_R2_r1.PE2SE.nodup.tn5.pf.pval.signal.bigwig \
	      /srv/www/kundaje/annashch/age/age_bigwig/MuSC_d5_Y_25K_R1_r1.PE2SE.nodup.tn5.pf.pval.signal.bigwig \
	      /srv/www/kundaje/annashch/age/age_bigwig/MuSC_d7_Y_10K_R1_r1.PE2SE.nodup.tn5_MuSC_d7_Y_10K_R2_r1.PE2SE.nodup.tn5.pf.pval.signal.bigwig \
	      -R $tf.bed \
	      -o $tf.matrix.mat.gz \
	      --binSize=5 \
	      --beforeRegionStartLength 1000 \
	      --afterRegionStartLength 1000 \
	      --regionBodyLength 10

plotHeatmap -m $tf.matrix.mat.gz -out $tf.svg

