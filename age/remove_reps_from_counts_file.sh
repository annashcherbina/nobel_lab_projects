#RNA-seq
#python ../utility/remove_reps_from_counts_file.py --to_remove d0_Old_R2 d0_S_KO_R1 d0_S_KO_R2 d0_WT_R1 d0_WT_R2 d0_Y_R1 d0_Y_R2 d0_Y_R3 d0_Y_R4 d1_Y_R1 d1_Y_R2 d21_KO_R1 d21_KO_R2 d21_WT_R1 d2_Y_R1 d2_Y_R2 d5_Old_R3\
#       --source_f age.rna.counts.txt.expected_count  age.rna.counts.txt.fpkm  age.rna.counts.txt.tpm\
#       --out_f age.rna.counts.txt.expected_count.filtered  age.rna.counts.txt.fpkm.filtered  age.rna.counts.txt.tpm.filtered

#ATAC-seq
#d0_Old_Rep4 d0_Y_Rep3 d7_Y_Rep1 d5_Y_Rep2 \
python ../utility/remove_reps_from_counts_file.py --to_remove d21_KO_Rep1 d21_KO_Rep2 d21_WT_Rep1 d21_WT_Rep2 \
       --source_f age.atac.counts.txt \
       --out_f age.atac.counts.txt.filtered


