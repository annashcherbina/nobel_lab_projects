#!/bin/bash
for sample in diff_hESC_HiFTCtrl.bed diff_hESC_LaminAKD.bed diff_hESC_Syne1Sun2KD.bed diff_HiFTCtrl_LaminAKD.bed diff_HiFTCtrl_Syne1Sun2KD.bed diff_LaminAKD_Syne1Sun2KD.bed shared.bed unique.hESC.bed unique.HiFTCtrl.bed unique.LaminAKD.bed unique.Syne1Sun2KD.bed
do
bedtools closest -a $sample -b hg38_gencode_tss_unique.bed -d > closest.$sample
done
