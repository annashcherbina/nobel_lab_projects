for i in *bed
do
    fastaFromBed -fi /mnt/data/annotations/by_release/mm10/mm10_no_alt_analysis_set_ENCODE.fasta -bed $i -fo $i.fa
done
