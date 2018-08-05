for i in d0_Y_vs_d0_O d1_Y_vs_d1_O d3_Y_vs_d3_O d5_Y_vs_d5_O d7_Y_vs_d7_O 
do
    #findMotifsGenome.pl $i.up.bed mm10 ../homer/$i.up -bg ../naive_overlap.bed &
    findMotifsGenome.pl $i.down.bed mm10 ../homer/$i.down -bg ../naive_overlap.bed &
done
