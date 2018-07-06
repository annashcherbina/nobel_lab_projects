for comp in ./d3_v_d1_Y.Comparison/d3_Y.bam.out_vs_d1_Y.bam.out/bayes-factors/filtered ./d7_v_d5_Old.Comparison/d7_Old.bam.out_vs_d5_Old.bam.out/bayes-factors/filtered ./d3_v_d1_Old.Comparison/d3_Old.bam.out_vs_d1_Old.bam.out/bayes-factors/filtered ./d1_v_d0_Old.Comparison/d1_Old.bam.out_vs_d0_Old.bam.out/bayes-factors/filtered ./d0.Comparison/d0_Old.bam.out_vs_d0_Y.bam.out/bayes-factors/filtered ./d5_v_d3_Y.Comparison/d5_Y.bam.out_vs_d3_Y.bam.out/bayes-factors/filtered ./d5.Comparison/d5_Old.bam.out_vs_d5_Y.bam.out/bayes-factors/filtered ./d7_v_d5_Y.Comparison/d7_Y.bam.out_vs_d5_Y.bam.out/bayes-factors/filtered ./d7.Comparison/d7_Old.bam.out_vs_d7_Y.bam.out/bayes-factors/filtered ./d3.Comparison/d3_Old.bam.out_vs_d3_Y.bam.out/bayes-factors/filtered ./d1_v_d0_Y.Comparison/d1_Y.bam.out_vs_d0_Y.bam.out/bayes-factors/filtered ./d1.Comparison/d1_Old.bam.out_vs_d1_Y.bam.out/bayes-factors/filtered ./d5_v_d3_Old.Comparison/d5_Old.bam.out_vs_d3_Old.bam.out/bayes-factors/filtered 
do
    mkdir $comp.plot
    python plot_miso.py --diff_miso $comp \
	   --miso_to_gene $comp.events.bed.intersection.mapping \
	   --index_dir /data/mm10/miso/indexed.SE \
	   --sashimi_setting sashimi_plot_settings.txt \
	   --output_dir $comp.plot &
done
