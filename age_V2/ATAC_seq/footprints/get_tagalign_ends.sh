prefix="/mnt/lab_data2/annashch/nobel_lab_projects/age_V2/ATAC_seq/tagAligns"
for sample in d0_Y d0_A d1_Y d1_A d3_Y d3_A d5_Y d5_A d7_Y d7_A
do
    python contract_bed.py --inputf $prefix/$sample.pos.bed --strand forward --outf $prefix/$sample.pos.5p.bed &
    python contract_bed.py --inputf $prefix/$sample.neg.bed --strand reverse --outf $prefix/$sample.neg.5p.bed &
done
