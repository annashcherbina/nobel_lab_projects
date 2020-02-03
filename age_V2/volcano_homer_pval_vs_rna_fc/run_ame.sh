for seq in seqs/day*fa
do
    echo $seq
    bname=`basename $seq`
    ame --verbose 1 --oc $bname.ame --scoring avg --method fisher --pvalue-report-threshold 10.0  --control seqs/background.bed.fa  $seq pwms/all.meme
done
