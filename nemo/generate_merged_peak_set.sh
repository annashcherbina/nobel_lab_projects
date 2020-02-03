#!/bin/sh
#concatenatxe, merge, the naive overlap peaks from all 9 samples;
export sample_prefix=/srv/gsfs0/projects/kundaje/users/annashch/Dropbox/NEMO_Knockout/ATAC-Seq/Sample_89787
#for index in `seq 1 9`
#do 
#    zcat $sample_prefix\_$index/out/peak/macs2/overlap/*.naive_overlap.narrowPeak.gz >> naive_overlap.bed 
#done
#bedtools sort -i naive_overlap.bed > naive_overlap.sorted.bed 
#bedtools merge -i naive_overlap.sorted.bed > naive_overlap.sorted.merged.bed 
#echo "generated merged peak file"

# paste the files together to create a read count file 
#cut -f1,2,3 naive_overlap.sorted.merged.bed > counts.txt

#count the number of reads that fall within each peak 
#module load bedtools 
for index in `seq 1 9`
do 
    for rep in `seq 1 4`
    do
	echo "index:$index, rep:$rep"
	#gzip -d $sample_prefix\_$index/out/align/rep$rep/*trim.PE2SE.nodup.tn5.tagAlign.gz
	#bedtools sort -i $sample_prefix\_$index/out/align/rep$rep/*trim.PE2SE.nodup.tn5.tagAlign > $sample_prefix\_$index/out/align/rep$rep/*trim.PE2SE.nodup.tn5.tagAlign.sorted
	/srv/gsfs0/software/bedtools/2.26.0/bedtools2/bin/bedtools coverage -counts -a naive_overlap.sorted.merged.bed -b $sample_prefix\_$index/out/align/rep$rep/*trim.PE2SE.nodup.tn5.tagAlign | cut -f4 > $index.rep$rep.counts 
	echo "$index.rep$rep.counts" >> header.txt 
	paste $index.rep$rep.counts >> counts.txt
    done
done





