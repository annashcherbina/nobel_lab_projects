h4k20me1_signal=open("both.H4K20me1.coverage.fc.txt",'r').read().strip().split('\n')
atac_data=open("atac/both.H4K20me1_to_atac_info.tsv",'r').read().strip().split('\n')
gene_data=open('rna/both.H4K20me1_to_gene_info.tsv','r').read().strip().split('\n')
print("read all data")
signal_dict={}
atac_dict={}
gene_dict={}
for line in h4k20me1_signal[1::]:
    tokens=line.split('\t')
    signal_dict[tuple(tokens[0:3])]=line
for line in atac_data:
    tokens=line.split('\t')
    atac_dict[tuple(tokens[0:3])]=line
for line in gene_data:
    tokens=line.split('\t')
    gene_dict[tuple(tokens[0:3])]=line
outf=open('merged.txt','w')
for entry in signal_dict: 
    if entry not in atac_dict:
        continue
    if entry not in gene_dict:
        continue
    outf.write(signal_dict[entry]+'\t'+atac_dict[entry]+'\t'+gene_dict[entry]+'\n')
outf.close()
