#!/bin/bash
module load homer
#for sample in diff_hESC_HiFTCtrl diff_hESC_LaminAKD diff_hESC_Syne1Sun2KD diff_HiFTCtrl_LaminAKD diff_LaminAKD_Syne1Sun2KD shared unique.hESC unique.HiFTCtrl unique.LaminAKD unique.Syne1Sun2KD
for sample in diff_hESC_LaminAKD diff_hESC_Syne1Sun2KD diff_HiFTCtrl_LaminAKD diff_LaminAKD_Syne1Sun2KD shared unique.hESC unique.HiFTCtrl unique.LaminAKD unique.Syne1Sun2KD
do
    findMotifsGenome.pl $sample.bed hg38 $sample -bg naive_overlap.optimal_set.sorted.merged.bed  -p 40
done

