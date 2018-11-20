for motif in ap1 ap4 ctcf nfkb runx1
do
    # Ap1 positive NEMO
    bedtools coverage -a $motif.intersection.padded.bed -b Nemo.tagAlign.pos.5p.bed -d  > Nemo.$motif.pos.cuts.bed &

    #Ap1 negative NEMO
    bedtools coverage -a $motif.intersection.padded.bed -b Nemo.tagAlign.neg.3p.bed -d  > Nemo.$motif.neg.cuts.bed &


    # Ap1 positive control
    bedtools coverage -a $motif.intersection.padded.bed -b Control.tagAlign.pos.5p.bed -d  > Control.$motif.pos.cuts.bed &

    # Ap1 negative control
    bedtools coverage -a $motif.intersection.padded.bed -b Control.tagAlign.neg.3p.bed -d  > Control.$motif.neg.cuts.bed &
done
