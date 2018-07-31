#Age dataset
rm -r tb_logs
mkdir tb_logs
CUDA_VISIBLE_DEVICES=7 kerasAC_train --train_path age.train.bed \
		    --valid_path age.validate.bed \
		    --model_output_file age \
		    --batch_size 1000 \
		    --num_tasks 10 \
		    --init_weights /srv/scratch/annashch/deeplearning/encode-roadmap.dnase_tf-chip.batch_256.params.npz \
		    --architecture_from_file arch1.py \
		    --num_train 58800 \
		    --epochs 40 \
		    --patience 5 \
		    --patience_lr 2 \
		    --revcomp \
		    --tensorboard \
		    --tensorboard_logdir tb_logs \
		    --ref_fasta /mnt/data/annotations/by_release/mm10/GRCm38.genome.fa

