data=open("RSEM.genes.fpkm.gt1.noGm.averagedreps.tsv",'r').read().strip().split('\n')
outf=open("FOLD.CHANGE.rsem.fpkm.gt1.noGm.averagedreps.tsv",'w')
outf.write("GeneID\tGeneName\tDay0_Sat\tDay2_Sat\tDay4_Sat\tDay7_Sat\n")
for line in data[1::]:
    tokens=line.split('\t')
    gene_info=tokens[0:2]
    vals=[float(i) for i in tokens[2::]]
    try:
        d0=vals[1]/vals[0]
    except:
        d0=vals[1]
    try:
        d2=vals[3]/vals[2]
    except:
        d2=vals[3]
    try:
        d4=vals[5]/vals[4]
    except:
        d4=vals[5]
    try:
        d7=vals[7]/vals[6]
    except:
        d7=vals[7]
    outvals='\t'.join([str(i) for i in [d0,d2,d4,d7]])
    outf.write('\t'.join(gene_info)+'\t'+outvals+'\n')
