#!/bin/bash
for sample in d21_old_R1 d21_old_R2  d21_young_R1  d21_young_R2  d21_young_R3
do
    ./quant_rna_rsem_single_end.sh --rsemGenomeDir /data/mm10/rsem/rsem --transcriptBAM STAR_$sample/STAR_$sample\Aligned.toTranscriptome.out.bam  --ncpus 50 --output RSEM_$sample
done

