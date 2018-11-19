for motif in ap1 ap4 ctcf nfkb runx1
do
    scanMotifGenomeWide.pl $motif.motif mm9 -p 10 -bed > $motif.mm9.bed
done
