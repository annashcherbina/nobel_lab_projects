grep -w -f old.seacr.tss.near.peaks.bed  young.seacr.tss.near.peaks.bed > common.bed
grep -v -w -f old.seacr.tss.near.peaks.bed young.seacr.tss.near.peaks.bed > young.only.bed
grep -v -w -f young.seacr.tss.near.peaks.bed old.seacr.tss.near.peaks.bed > old.only.bed 

