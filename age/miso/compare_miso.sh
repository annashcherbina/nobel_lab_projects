#Old vs Young for single timepoint 
compare_miso --compare-samples d0_Old.bam.out d0_Y.bam.out d0.Comparison &
compare_miso --compare-samples d1_Old.bam.out d1_Y.bam.out d1.Comparison &
compare_miso --compare-samples d3_Old.bam.out d3_Y.bam.out d3.Comparison &
compare_miso --compare-samples d5_Old.bam.out d5_Y.bam.out d5.Comparison &
compare_miso --compare-samples d7_Old.bam.out d7_Y.bam.out d7.Comparison &

#Young across adjacent timepoints
compare_miso --compare-samples d1_Y.bam.out d0_Y.bam.out d1_v_d0_Y.Comparison &
compare_miso --compare-samples d3_Y.bam.out d1_Y.bam.out d3_v_d1_Y.Comparison &
compare_miso --compare-samples d5_Y.bam.out d3_Y.bam.out d5_v_d3_Y.Comparison &
compare_miso --compare-samples d7_Y.bam.out d5_Y.bam.out d7_v_d5_Y.Comparison &

#Old Across adjacent timepoints
compare_miso --compare-samples d1_Old.bam.out d0_Old.bam.out d1_v_d0_Old.Comparison &
compare_miso --compare-samples d3_Old.bam.out d1_Old.bam.out d3_v_d1_Old.Comparison &
compare_miso --compare-samples d5_Old.bam.out d3_Old.bam.out d5_v_d3_Old.Comparison &
compare_miso --compare-samples d7_Old.bam.out d5_Old.bam.out d7_v_d5_Old.Comparison &
