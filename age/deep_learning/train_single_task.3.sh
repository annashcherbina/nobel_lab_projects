#Age dataset
for i in `seq 7 9`
do
    mkdir tb_logs/$i
    CUDA_VISIBLE_DEVICES=4 kerasAC_train --train_path age.train.augmented.$i.shuffled.bed \
		    --valid_path age.validate.$i.bed \
		    --model_output_file age.$i \
		    --batch_size 1000 \
		    --num_tasks 1 \
		    --init_weights /srv/scratch/annashch/deeplearning/encode-roadmap.dnase_tf-chip.batch_256.params.npz \
		    --architecture_from_file arch1.py \
		    --num_train 211222 \
		    --epochs 40 \
		    --patience 5 \
		    --patience_lr 2 \
		    --revcomp \
		    --tensorboard \
		    --tensorboard_logdir tb_logs/$i \
		    --ref_fasta /mnt/data/annotations/by_release/mm10/GRCm38.genome.fa

done
