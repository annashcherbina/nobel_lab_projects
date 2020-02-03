annotates sets of peaks with chromHMM annotations 
bedtools closest -a ../nemo_merged.bed -b limb.embryonic.ENCFF070VHJ.collapsed.bed | cut -f1,2,3,7 > nemo_annotations_limb.bed 
bedtools closest -a ../nemo_merged.bed -b heart.ENCFF786MCR.collapsed.bed | cut -f1,2,3,7 > nemo_annotations_heart.bed
bedtools closest -a ../sample_9_control.overlap.bed -b limb.embryonic.ENCFF070VHJ.collapsed.bed | cut -f1,2,3,14 > control_annotations_limb.bed
bedtools closest -a ../sample_9_control.overlap.bed -b heart.ENCFF786MCR.collapsed.bed | cut -f1,2,3,14 > control_annotations_heart.bed
bedtools closest -a ../NEMO_Control_4.bed -b limb.embryonic.ENCFF070VHJ.collapsed.bed | cut -f1,2,3,7 > differential_annotations_limb.bed
bedtools closest -a ../NEMO_Control_4.bed -b heart.ENCFF786MCR.collapsed.bed | cut -f1,2,3,7 > differential_annotations_heart.bed