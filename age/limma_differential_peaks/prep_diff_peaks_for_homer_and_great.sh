#version 1
#python ../../utility/prep_diff_peaks_for_homer_and_great.py --input_f differential_peaks_d0_Y_vs_d0_O.tsv differential_peaks_d1_Y_vs_d1_O.tsv differential_peaks_d3_Y_vs_d3_O.tsv differential_peaks_d5_Y_vs_d5_O.tsv differential_peaks_d7_Y_vs_d7_O.tsv differential_peaks_d1_O_vs_d0_O.tsv differential_peaks_d3_O_vs_d1_O.tsv differential_peaks_d5_O_vs_d3_O.tsv differential_peaks_d7_O_vs_d5_O.tsv differential_peaks_d1_Y_vs_d0_Y.tsv differential_peaks_d3_Y_vs_d1_Y.tsv differential_peaks_d5_Y_vs_d3_Y.tsv differential_peaks_d7_Y_vs_d5_Y.tsv \
#       --tasks d0_Y_vs_d0_O d1_Y_vs_d1_O d3_Y_vs_d3_O d5_Y_vs_d5_O d7_Y_vs_d7_O d1_O_vs_d0_O d3_O_vs_d1_O d5_O_vs_d3_O d7_O_vs_d5_O d1_Y_vs_d0_Y d3_Y_vs_d1_Y d5_Y_vs_d3_Y d7_Y_vs_d5_Y \
#       --out_dir .

#just get the first 3 columns for homer
#for i in d0_Y_vs_d0_O d1_Y_vs_d1_O d3_Y_vs_d3_O d5_Y_vs_d5_O d7_Y_vs_d7_O d1_O_vs_d0_O d3_O_vs_d1_O d5_O_vs_d3_O d7_O_vs_d5_O d1_Y_vs_d0_Y d3_Y_vs_d1_Y d5_Y_vs_d3_Y d7_Y_vs_d5_Y
#do
#    cut -f1,2,3 $i.bed.sorted > $i.bed
#    echo $i 
#done
###########################################################################################################################
#version 2 
python ../../utility/prep_diff_peaks_for_homer_and_great.py --input_f differential_peaks_d0_Y_vs_d0_O.tsv differential_peaks_d1_Y_vs_d1_O.tsv differential_peaks_d3_Y_vs_d3_O.tsv differential_peaks_d5_Y_vs_d5_O.tsv differential_peaks_d7_Y_vs_d7_O.tsv  \
       --tasks d0_Y_vs_d0_O d1_Y_vs_d1_O d3_Y_vs_d3_O d5_Y_vs_d5_O d7_Y_vs_d7_O \
       --out_dir . \
       --pval_thresh 0.001
for i in *up.bed
do

    bedtools sort -i $i > $i.sorted
done
for i in *down.bed
do
    bedtools sort -i $i > $i.sorted
done

for i in d0_Y_vs_d0_O d1_Y_vs_d1_O d3_Y_vs_d3_O d5_Y_vs_d5_O d7_Y_vs_d7_O 
do
    cut -f1,2,3 $i.up.bed.sorted > $i.up.bed
    cut -f1,2,3 $i.down.bed.sorted > $i.down.bed
    echo $i 
done

wc -l *bed
