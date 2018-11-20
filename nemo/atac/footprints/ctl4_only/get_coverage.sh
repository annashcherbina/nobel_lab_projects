for motif in ap1 ap4 ctcf nfkb runx1
do

    # Ap1 positive control
    bedtools coverage -a ../$motif.intersection.padded.bed -b Control.4.tagAlign.pos.5p.bed -d  > Control.4.$motif.pos.cuts.bed &

    # Ap1 negative control
    bedtools coverage -a ../$motif.intersection.padded.bed -b Control.4.tagAlign.neg.3p.bed -d  > Control.4.$motif.neg.cuts.bed &
done
