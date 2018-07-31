#Old vs Young for single timepoint
for prefix in A3SS A5SS MXE RI
do
    
compare_miso --compare-samples $prefix/d0_Old.bam.out $prefix/d0_Y.bam.out $prefix/d0.Comparison &
compare_miso --compare-samples $prefix/d1_Old.bam.out $prefix/d1_Y.bam.out $prefix/d1.Comparison &
compare_miso --compare-samples $prefix/d3_Old.bam.out $prefix/d3_Y.bam.out $prefix/d3.Comparison &
compare_miso --compare-samples $prefix/d5_Old.bam.out $prefix/d5_Y.bam.out $prefix/d5.Comparison &
compare_miso --compare-samples $prefix/d7_Old.bam.out $prefix/d7_Y.bam.out $prefix/d7.Comparison &
done
#Young across adjacent timepoints
#compare_miso --compare-samples d1_Y.bam.out d0_Y.bam.out d1_v_d0_Y.Comparison &
#compare_miso --compare-samples d3_Y.bam.out d1_Y.bam.out d3_v_d1_Y.Comparison &
#compare_miso --compare-samples d5_Y.bam.out d3_Y.bam.out d5_v_d3_Y.Comparison &
#compare_miso --compare-samples d7_Y.bam.out d5_Y.bam.out d7_v_d5_Y.Comparison &

#Old Across adjacent timepoints
#compare_miso --compare-samples d1_Old.bam.out d0_Old.bam.out d1_v_d0_Old.Comparison &
#compare_miso --compare-samples d3_Old.bam.out d1_Old.bam.out d3_v_d1_Old.Comparison &
#compare_miso --compare-samples d5_Old.bam.out d3_Old.bam.out d5_v_d3_Old.Comparison &
#compare_miso --compare-samples d7_Old.bam.out d5_Old.bam.out d7_v_d5_Old.Comparison &
