bedtools closest -d -a ap1.unique.Young.bed  -b tss.gencode.vM25.basic.annotation.bed | awk -F"\t" '$8<5000' > ap1.unique.Young.nearest.tss.bed
bedtools closest -d -a ap1.unique.Aged.bed  -b tss.gencode.vM25.basic.annotation.bed  | awk -F"\t" '$8<5000' > ap1.unique.Aged.nearest.tss.bed 

