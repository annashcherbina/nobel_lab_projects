peak_to_atac_tpm_young=open("young.peaks.atac.tpm.txt",'r').read().strip().split('\n')
peak_to_atac_pval_young=open("young.peaks.atac.pval.txt",'r').read().strip().split('\n') 
peak_to_atac_tpm_aged=open("aged.peaks.atac.tpm.txt",'r').read().strip().split('\n') 
peak_to_atac_pval_aged=open("aged.peaks.atac.pval.txt",'r').read().strip().split('\n')
print("loaded all data")
young_dict={}
aged_dict={}
for line in peak_to_atac_tpm_young:
    tokens=line.split('\t')
    chrom=tokens[0]
    start_pos=tokens[1]
    end_pos=tokens[2]
    key=(chrom,start_pos,end_pos)
    aged_tpm=max([0,float(tokens[6])])
    young_tpm=max([0,float(tokens[7])])
    if aged_tpm==0:
        fc=young_tpm
    else:
        fc=young_tpm/aged_tpm
    young_dict[key]=[fc]
for line in peak_to_atac_pval_young:
    tokens=line.split('\t')
    chrom=tokens[0]
    start_pos=tokens[1]
    end_pos=tokens[2]
    key=(chrom,start_pos,end_pos)
    pval=float(tokens[-1])
    young_dict[key].append(pval)
print("got young dictionary")

for line in peak_to_atac_tpm_aged:
    tokens=line.split('\t')
    chrom=tokens[0]
    start_pos=tokens[1]
    end_pos=tokens[2]
    key=(chrom,start_pos,end_pos)
    aged_tpm=max([0,float(tokens[6])])
    young_tpm=max([0,float(tokens[7])])
    if aged_tpm==0:
        fc=young_tpm
    else:
        fc=young_tpm/aged_tpm
    aged_dict[key]=[fc]
for line in peak_to_atac_pval_aged:
    tokens=line.split('\t')
    chrom=tokens[0]
    start_pos=tokens[1]
    end_pos=tokens[2]
    key=(chrom,start_pos,end_pos)
    pval=float(tokens[-1])
    aged_dict[key].append(pval)
print("got aged dictionary")


outf=open("young.H4K20me1_to_atac_info.tsv",'w')
for key in young_dict:
    chrom=key[0]
    start=key[1]
    end=key[2]
    fc=str(young_dict[key][0])
    if len(young_dict[key])==2:
        pval=str(young_dict[key][1])
    else:
        pval=str(1)
    outf.write(chrom+'\t'+start+'\t'+end+'\t'+fc+'\t'+pval+'\n')
outf.close()

outf=open("aged.H4K20me1_to_atac_info.tsv",'w')
for key in aged_dict:
    chrom=key[0]
    start=key[1]
    end=key[2]
    fc=str(aged_dict[key][0])
    if len(aged_dict[key])==2:
        pval=str(aged_dict[key][1])
    else:
        pval=str(1)
    outf.write(chrom+'\t'+start+'\t'+end+'\t'+fc+'\t'+pval+'\n')
outf.close()
