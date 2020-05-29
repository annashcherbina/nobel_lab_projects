cut -f1,2,3 -d'-' ap1.filtered.Young.Intersection.h4k20me1.atac.bed | cut -f1 | sort | uniq | sed -e 's/-/\t/g' | grep -v "Position" | bedtools sort -i -  > ap1.unique.Young.bed
cut -f1,2,3 -d'-' ap1.filtered.Aged.Intersection.h4k20me1.atac.bed | cut -f1 | sort | uniq | sed -e  's/-/\t/g' | grep -v "Position" | bedtools sort -i - > ap1.unique.Aged.bed
