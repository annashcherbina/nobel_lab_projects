#!/bin/bash

#for peaks unique to a region/ shared across all regions 
#computeMatrix reference-point -S hESC.signal.rpkm.bw HiFTCtrl.signal.rpkm.bw LaminAKD.signal.rpkm.bw Syne1Sun2KD.signal.rpkm.bw -R shared.bed unique.hESC.bed unique.HiFTCtrl.bed unique.LaminAKD.bed unique.Syne1Sun2KD.bed --referencePoint center -b 1000 -a 1000 -bs=1 -p=max -out matrix.gz
#plotHeatmap -m matrix.gz --outFileName matrix.pdf --colorMap=Blues

#for limma differential peak sets
#computeMatrix reference-point -S hESC.signal.rpkm.bw HiFTCtrl.signal.rpkm.bw LaminAKD.signal.rpkm.bw Syne1Sun2KD.signal.rpkm.bw -R diff_hESC_HiFTCtrl.bed diff_hESC_LaminAKD.bed diff_hESC_Syne1Sun2KD.bed diff_HiFTCtrl_LaminAKD.bed diff_LaminAKD_Syne1Sun2KD.bed --referencePoint center -b 1000 -a 1000 -bs=1 -p=max -out diffpeaks.matrix.gz
plotHeatmap -m diffpeaks.matrix.gz --outFileName diffpeaks.matrix.pdf --colorMap=Blues
