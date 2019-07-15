#!/bin/bash
python filter_to_good_reps.py --counts_file ../all_reps_counts_batches/age.rna.counts.txt.tpm \
       --batches_file ../all_reps_counts_batches/batches.txt \
       --samples_to_keep good_reps.txt \
       --outf_filtered_counts_file age.rna.counts.goodreps.txt.tpm \
       --outf_filtered_batches_file batches.goodreps.txt
