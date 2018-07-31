for i in `seq 0 9`
do
    python /users/annashch/anna_utils/seq_utils/sample_bed_file_randomly.py --bed age.train.augmented.$i.bed \
	   --outf age.train.augmented.$i.shuffled.bed
done
