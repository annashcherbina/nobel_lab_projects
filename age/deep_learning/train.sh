#extra tasks for tf's that are enriched in false positive set (KLF4, OBOX5, PAX8, SPZ1, TCF3), initialize w/ ENCODE weights
CUDA_VISIBLE_DEVICES=7 kerasAC_train --train_path age.train.bed \
		    --valid_path age.validate.bed \
		    --model_output_file age \
		    --batch_size 1000 \
		    --num_tasks 10 \
		    --init_weights /srv/scratch/annashch/deeplearning/encode-roadmap.dnase_tf-chip.batch_256.params.npz \
		    --architecture_spec basset_architecture_multitask \
		    --num_train 58800 \
		    --epochs 40 \
		    --patience 5 \
		    --revcomp \
		    --tensorboard \
		    --tensorboard_logdir tb_logs \
		    --ref_fasta /mnt/data/annotations/by_release/mm10/GRCm38.genome.fa

