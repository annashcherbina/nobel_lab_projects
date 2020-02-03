#chip with myo
bedtools intersect -u -a myo.MYOD1.bed -b myod.scan.out.bed > myo.motif
echo "got myo.motif"
bedtools intersect -v -a myo.MYOD1.bed -b myod.scan.out.bed > myo.nomotif
echo "got myo.nomotif"

for atac in `cat overlap_peaks.txt`
do
    #chip
    base_atac=`basename $atac`
    bedtools intersect -u -a myo.MYOD1.bed -b $atac | bedtools intersect -u -a stdin -b myo.motif > $base_atac.direct
    bedtools intersect -v -a myo.motif -b $atac > $base_atac.indirect
    bedtools intersect -v -a myo.nomotif -b $atac > $base_atac.indeterminate
    echo "done with $atac" 
done
