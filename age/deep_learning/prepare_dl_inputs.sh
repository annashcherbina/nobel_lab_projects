python generate_input_bed_file.py
python ~/anna_utils/seq_utils/expand_peaks.py --bed_file age_dl_inputs.bed --outf age_dl_inputs.1000.bed --skip_header
python ~/anna_utils/seq_utils/get_train_valid_test_splits.py --source age_dl_inputs.1000.bed \
       --test_chroms chr2 \
       --valid_chroms chr1 \
       --out_prefix age
