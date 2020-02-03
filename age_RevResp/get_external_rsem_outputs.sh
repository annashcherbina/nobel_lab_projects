oak_prefix=/oak/stanford/groups/akundaje/annashch/nobel_age_rnaseq/external/PRJEB10091
for sample in ERR975344 ERR975345 ERR975346 ERR975347 ERR975348 ERR975349
do
    cut -f1,6 $oak_prefix/$sample\_RSEM_OUTPUT/rsem.quant.genes.results > $sample.tpm.txt
done

oak_prefix=/oak/stanford/groups/akundaje/annashch/nobel_age_rnaseq/external/GSE87365
for sample in SRR4296455.1 SRR4296456.1
do
    cut -f1,6 $oak_prefix/$sample\_RSEM_OUTPUT/rsem.quant.genes.results > $sample.tpm.txt
done

python aggregate_external_tpms.py --samples ERR975344.tpm.txt ERR975345.tpm.txt ERR975346.tpm.txt ERR975347.tpm.txt ERR975348.tpm.txt ERR975349.tpm.txt SRR4296455.1.tpm.txt SRR4296456.1.tpm.txt --outf aggregate_external_tpms.txt --genemap map.txt


