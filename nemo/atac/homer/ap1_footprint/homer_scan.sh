#GET THE AP1 FOOTPRINT FOR NEMO, IKK, CONTROl 
#annotatePeaks.pl nemo.narrowPeak  mm9  -m known5.motif  -size 1000 -hist 10 > ap1.NEMO.footprint.hist
#annotatePeaks.pl control.narrowPeak  mm9  -m known5.motif  -size 1000 -hist 10 > ap1.Control.footprint.hist
#annotatePeaks.pl ikk.narrowPeak  mm9  -m known5.motif  -size 1000 -hist 10 > ap1.IKK.footprint.hist

annotatePeaks.pl /srv/scratch/annashch/nobel_lab_projects/nemo/atac/control.4.bed mm9  -m known5.motif  -size 50 -hist 1 > ap1.footprint.control.4 &


annotatePeaks.pl /srv/scratch/annashch/nobel_lab_projects/nemo/atac/control.2.bed mm9  -m known5.motif  -size 50 -hist 1 > ap1.footprint.control.2 &


annotatePeaks.pl /srv/scratch/annashch/nobel_lab_projects/nemo/atac/nemo.4.bed mm9  -m known5.motif  -size 50 -hist 1 > ap1.footprint.nemo.4 &


annotatePeaks.pl /srv/scratch/annashch/nobel_lab_projects/nemo/atac/nemo.5.bed mm9  -m known5.motif  -size 50 -hist 1 > ap1.footprint.nemo.5 &


