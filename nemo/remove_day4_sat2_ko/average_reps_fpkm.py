data=open("RSEM.genes.fpkm.gt1.noGm.tsv").read().strip().split('\n')
outf=open("RSEM.genes.fpkm.gt1.noGm.averagedreps.tsv",'w')
outf.write("GeneId\tGeneName\tDay0_Sat_WT\tDay0_Sat_KO\tDay2_Sat_WT\tDay2_Sat_KO\tDay4_Sat_WT\tDay4_Sat_KO\tDay7_Sat_WT\tDay7_Sat_KO\n")
for line in data[1::]:
    tokens=line.split('\t')
    print(str(tokens))
    gene='\t'.join(tokens[0:2])
    outvals=[gene]
    vals=[float(i) for i in tokens[2::]]
    #Day0_Sat_WT
    outvals.append(0.5*sum([vals[0],vals[2]]))
    #Day0_Sat_KO
    outvals.append(0.5*sum([vals[1],vals[3]]))
    #Day2_Sat_WT
    outvals.append(0.5*sum([vals[5],vals[7]]))
    #Day2_Sat_KO
    outvals.append(0.5*sum([vals[4],vals[6]]))
    #Day4_Sat_WT
    outvals.append(0.5*sum([vals[9],vals[10]]))
    #Day4_Sat_KO
    outvals.append(vals[8])
    #Day7_Sat_WT
    outvals.append(0.5*sum([vals[11],vals[13]]))
    #Day7_Sat_KO
    outvals.append(0.5*sum([vals[12],vals[14]]))
    outvals=[str(i) for i in outvals]
    outf.write('\t'.join(outvals)+'\n')
    
