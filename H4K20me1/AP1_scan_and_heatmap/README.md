1) get AP1 motif instances in the H4K20me1+/ATAC+ sits
Start with these files:
filtered.Aged.Intersection.h4k20me1.atac.bed
filtered.Young.Intersection.h4k20me1.atac.bed
from homer, we get "ap1.motif"
execute:
```
scan_ap1.sh
```

2) Find genes with tss within 5kb of H4K20me1+/ATAC+/AP1+

```
unique_h4k20me1_with_ap1_and_atac.sh
```

3) get the nearest TSS to H4K20me1+/ATAC+/AP1+ genes
get gene names 
```
get_nearest_tss.sh
cat ap1.unique.Young.nearest.tss.bed ap1.unique.Aged.nearest.tss.bed | cut -f7| sort |uniq > gene_names_near_ap1.bed 
```

4) get mean corrected TPM in young and aged for these genes
Filter to genes with mean corrected TPM >=1 in either young or aged 

```
grep -w -f gene_names_near_ap1.bed d0_tpm_rep_averaged_with_coords.annotated.bed | cut -f5,6,7 | awk -F"\t" '$2>=1 || $3>=1' > gene_corrected_tpm_expressed.txt 
```
#this gives 130 genes

4.5) Intersect these genes with p-values for differentially expressed genes at day 0 between young and aged.
see "rna" subfolder




