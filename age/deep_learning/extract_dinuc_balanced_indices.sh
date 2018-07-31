for i in `seq 0 9`
do
    python /srv/scratch/annashch/deeplearning/form_inputs/code/gc_dinuc_balanced/extract_dinuc_and_gc_balanced_indices.py \
	   --bed_label_file age.train.augmented.bed \
	   --numpy_index_file age.train.$i.npy \
	   --task_index $i \
	   --outf age.train.augmented.$i.bed
    echo $i
done
