#Age dataset
rm -rf tb_logs/arch5
mkdir tb_logs/arch5
tb_dir=tb_logs/arch5
mkdir $tb_dir
i=6
CUDA_VISIBLE_DEVICES=4 kerasAC_train --train_path age.train.augmented.$i.shuffled.bed \
		    --valid_path age.validate.$i.bed \
		    --model_output_file age.$i \
		    --batch_size 1000 \
		    --num_tasks 1 \
		    --num_train 211222 \
		    --epochs 40 \
		    --patience 3 \
		    --patience_lr 2 \
		    --revcomp \
		    --tensorboard \
		    --tensorboard_logdir $tb_dir \
		    --ref_fasta /mnt/data/annotations/by_release/mm10/GRCm38.genome.fa \
		    --architecture_from_file arch5.py

