data=open('mm9.gtf','r').read().strip().split('\n')
coord_dict=dict()
outf=open('introns.bed','w')
for line in data:
    tokens=line.split('\t')
    element_type=tokens[2]
    if element_type not in ['start_codon','end_codon']:
        continue
    gene=tokens[-1].split(';')[0]
    start_pos=int(tokens[3])
    end_pos=int(tokens[4])
    chrom=tokens[0]
    if gene not in coord_dict:
        coord_dict[gene]=[chrom,start_pos,end_pos]
    elif start_pos < coord_dict[gene][1]:
        coord_dict[gene][1]=start_pos
    elif end_pos >  coord_dict[gene][2]:
        coord_dict[gene][2]=end_pos
for gene in coord_dict:
    outf.write('\t'.join([str(i) for i in coord_dict[gene]])+'\t'+gene+'\n')
    
    
