CUDA_VISIBLE_DEVICES=3 kerasAC_train --data_path age.regressionlabels.all_genome_bins_regression.hdf5 \
		    --model_hdf5 age.regressionlabels.allbins \
		    --ref_fasta /mnt/data/annotations/by_release/mm10/mm10_no_alt_analysis_set_ENCODE.fasta \
		    --batch_size 1000 \
		    --upsample_thresh 1.5 \
		    --train_upsample 0.3 \
		    --train_chroms chr3 chr4 chr5 chr6 chr7 chr8 chr9 chr10 chr11 chr12 chr13 chr14 chr15 chr16 chr17 chr18 chr19 chrX chrY \
		    --validation_chroms chr1 chr2 \
		    --architecture_from_file regression.py \
		    --num_train 1000000 \
		    --num_valid 1000000 \
		    --num_tasks 10 \
		    --threads 0 \
		    --max_queue_size 200 \
		    --init_weights /srv/scratch/annashch/deeplearning/encode-roadmap.dnase_tf-chip.batch_256.params.npz \
		    --patience 3 \
		    --patience_lr 2



