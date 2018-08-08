for cluster in `seq 1 19`
do
    findMotifsGenome.pl clusters.$cluster mm10 homer_$cluster -bg ../../naive_overlap.bed &
done
