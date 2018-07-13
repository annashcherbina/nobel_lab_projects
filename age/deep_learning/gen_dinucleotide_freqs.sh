#AGE DATASETS
#balance dinucleotide

python /srv/scratch/annashch/deeplearning/for_inputs/code/gc_dinuc_balanced/gen_dinucleotide_freqs.py --bed_path /srv/scratch/annashch/nobel_lab_projects/age/deep_learning/age.train.augmented.bed \
	   --outf age.freqs.bed \
	   --ratio_neg_to_pos 10 \
	   --task 0 \
	   --ref /mnt/data/annotations/by_release/mm10/GRCm38.genome.fa

python /srv/scratch/annashch/deeplearning/for_inputs/code/gc_dinuc_balanced/gen_dinucleotide_freqs.py --bed_path /srv/scratch/annashch/nobel_lab_projects/age/deep_learning/age.train.augmented.bed \
       --outf age.train \
       --ratio_neg_to_pos 10 10 10 10 10 10 10 10 10 10 \
       --dinuc_freqs age.freqs.bed \
       --ref /mnt/data/annotations/by_release/mm10/GRCm38.genome.fa
