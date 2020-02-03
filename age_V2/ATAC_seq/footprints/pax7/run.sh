#module load homer
#scanMotifGenomeWide.pl pax7.motif mm10 -p 10 -bed > pax7.scan.out.bed 
#intersect peaks with motifs
#for f in `cat ../overlap_peaks.txt`
#do
#    f_base=`basename $f`
#    #bedtools intersect -a pax7.scan.out.bed -b $f > $f_base.pax7.intersection.bed
#    #split by +/- strand
#    grep "-" $f_base.pax7.intersection.bed > $f_base.pax7.intersection.neg.bed
#    grep -v "-" $f_base.pax7.intersection.bed > $f_base.pax7.intersection.pos.bed
#    
#    #pad motif intesections to 200 bp
#    python ~/anna_utils/seq_utils/pad.py --input_bed $f_base.pax7.intersection.pos.bed --desired_length 200 --output_bed $f_base.pax7.intersection.pos.padded.bed --chromsizes ../mm10.chrom.sizes
#    python ~/anna_utils/seq_utils/pad.py --input_bed $f_base.pax7.intersection.neg.bed --desired_length 200 --output_bed $f_base.pax7.intersection.neg.padded.bed --chromsizes ../mm10.chrom.sizes    
#done

#concatenate motifs on pos strand across conditions
#cat *pos.padded.bed | bedtools sort -i stdin | uniq > intersections.pos.aggregate.bed 
#concatenate motifs on neg strand across conditions
#cat *neg.padded.bed | bedtools sort -i stdin | uniq > intersections.neg.aggregate.bed 

#tagAlign_base_dir=/mnt/lab_data2/annashch/nobel_lab_projects/age_V2/ATAC_seq/tagAligns
#for sample in d0_A d0_Y d1_Y d1_A  d3_A d3_Y d5_A d5_Y d7_A d7_Y
#do
#    # positive
#    echo $sample
#    bedtools coverage -a intersections.pos.aggregate.bed -b $tagAlign_base_dir/$sample.pos.5p.bed -d  > $sample.pos.cuts.bed &
#    #negative 
#    bedtools coverage -a intersections.neg.aggregate.bed -b $tagAlign_base_dir/$sample.neg.5p.bed -d  > $sample.neg.cuts.bed &
#done

python ../average_across_position.py --in_f *cuts.bed --out_f summary.txt

