import pandas as pd
data=open('aggregate.txt','r').read().strip().split('\n')
header=data[0].split('\t')
motif_dict=dict()
fields_to_keep=set([])
for line in data[1::]:
    tokens=line.split('\t')
    motif=tokens[0]
    if motif not in motif_dict:
        motif_dict[motif]={}
    for index in range(1,len(tokens)):
        cur_header=header[index].split('.')[1]
        fields_to_keep.add(cur_header) 
        cur_val=float(tokens[index])
        if cur_header not in motif_dict[motif]:
            motif_dict[motif][cur_header]=cur_val
        elif cur_val <  motif_dict[motif][cur_header]:
            motif_dict[motif][cur_header]=cur_val
outf=open("aggregate.collapsed.txt",'w')
fields_to_keep=list(fields_to_keep) 
outf.write('motif\t'+'\t'.join(fields_to_keep)+'\n')
for motif in motif_dict:
    outf.write(motif)
    for entry in fields_to_keep:
        outf.write('\t'+str(motif_dict[motif][entry]))
    outf.write('\n')
    
