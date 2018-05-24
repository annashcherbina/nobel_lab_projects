#get a merged peak file

#get read counts for each rep for the merged peak file 
bedtools coverage -counts -a merged_peaks/ppr.merged.bed -b SG2M_R2_treated/out/align/pooled_pseudo_reps/ppr2/slopped | cut -f4 > SG2M_R2_treated_pr2
