for f in `cat overlap_peaks.txt`
do
    f_base=`basename $f`
    echo $f_base
    bedtools closest -D b -t first -a $f -b mm10_gencode_tss_unique.bed.gz > $f_base.closest
done    
