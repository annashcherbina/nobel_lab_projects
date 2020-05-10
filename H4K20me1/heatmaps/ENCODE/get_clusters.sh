grep -w -f Young.tss.near.peaks.bed Old.tss.near.peaks.bed > common.bed
grep -v -w -f Young.tss.near.peaks.bed Old.tss.near.peaks.bed > old.only.bed
grep -v -w -f Old.tss.near.peaks.bed Young.tss.near.peaks.bed > young.only.bed
