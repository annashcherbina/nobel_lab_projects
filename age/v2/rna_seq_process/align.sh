#!/bin/bash
./map_rna_star_single_end.sh --R1 /nas/datasets/BOX/Aging/RNA-Seq/902-JL/Sample_902-JL-1/902-JL-1_CGAGGCTG-CGTCTAAT_S1_R1_001.fastq.gz --starGenomeDir /data/mm10/star --ncpus 50 --outputbase STAR_d21_old_R1
./map_rna_star_single_end.sh --R1 /nas/datasets/BOX/Aging/RNA-Seq/902-JL/Sample_902-JL-2/902-JL-2_AAGAGGCA-TCTCTCCG_S2_R1_001.fastq.gz --starGenomeDir /data/mm10/star --ncpus 50 --outputbase STAR_d21_old_R2
./map_rna_star_single_end.sh --R1 /nas/datasets/BOX/Aging/RNA-Seq/902-JL/Sample_902-JL-3/902-JL-3_GTAGAGGA-TCTCTCCG_S3_R1_001.fastq.gz --starGenomeDir /data/mm10/star --ncpus 50 --outputbase STAR_d21_young_R1
./map_rna_star_single_end.sh --R1 /nas/datasets/BOX/Aging/RNA-Seq/902-JL/Sample_902-JL-4/902-JL-4_GCTCATGA-TCTCTCCG_S4_R1_001.fastq.gz --starGenomeDir /data/mm10/star --ncpus 50 --outputbase STAR_d21_young_R2
./map_rna_star_single_end.sh --R1 /nas/datasets/BOX/Aging/RNA-Seq/902-JL/Sample_902-JL-5/902-JL-5_ATCTCAGG-TCTCTCCG_S5_R1_001.fastq.gz --starGenomeDir /data/mm10/star --ncpus 50 --outputbase STAR_d21_young_R3








