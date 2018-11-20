#for motif in ap1 ap4 ctcf nfkb runx1
for motif in ap1 ap4 ctcf runx1
do
    
    python generate_heatmap_for_footprint.py --coverage_files ../ctl4_only/Control.4.$motif.* --outf Control.4.$motif.tsv &
    python generate_heatmap_for_footprint.py --coverage_files ../Nemo.$motif.* --outf Nemo.$motif.tsv &
done
