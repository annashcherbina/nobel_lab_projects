#findMotifsGenome.pl NEMO_vs_Both_Controls.bed mm9 ../results/homer/both_controls
#findMotifsGenome.pl NEMO_Control_4.bed mm9 ../results/homer/control4

#get AP-1 Motif footprints 
#annotatePeaks.pl NEMO_Control_4.bed mm9 -size 1000 -hist 5 -m known5.motif > ap1.footprint
annotatePeaks.pl NEMO_Control_4.bed mm9  -m known5.motif  -size 1000 -hist 10 > ap1.footprint.hist
