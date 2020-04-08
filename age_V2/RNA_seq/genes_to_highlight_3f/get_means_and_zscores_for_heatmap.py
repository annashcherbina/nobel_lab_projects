import pandas as pd
from statistics import mean, stdev 
genes=pd.read_csv("RNA_transformed_tpm_minus_sva_contribs.subset.txt",header=0,sep='\t',index_col=1)
#average across replicates 
d0_Y=genes.filter(regex="d0_Y_Rep").mean(axis=1)
d0_A=genes.filter(regex="d0_A_Rep").mean(axis=1)
#d0_Y_Pax7=genes.filter(regex="d0_Y_Pax7_Rep").mean(axis=1)
d1_Y=genes.filter(regex="d1_Y_Rep").mean(axis=1)
d1_A=genes.filter(regex="d1_A_Rep").mean(axis=1)
d3_Y=genes.filter(regex="d3_Y_Rep").mean(axis=1)
d3_A=genes.filter(regex="d3_A_Rep").mean(axis=1)
d5_Y=genes.filter(regex="d5_Y_Rep").mean(axis=1)
d5_A=genes.filter(regex="d5_A_Rep").mean(axis=1)
d7_Y=genes.filter(regex="d7_Y_Rep").mean(axis=1)
d7_A=genes.filter(regex="d7_A_Rep").mean(axis=1)
d21_Y=genes.filter(regex="d21_Y_Rep").mean(axis=1)
d21_A=genes.filter(regex="d21_A_Rep").mean(axis=1)
diff_subset=pd.concat([d0_Y,d0_A,d1_Y,d1_A,d3_Y,d3_A,d5_Y,d5_A,d7_Y,d7_A,d21_Y,d21_A],axis=1)
diff_subset.columns=['d0_Y','d0_A','d1_Y','d1_A','d3_Y','d3_A','d5_Y','d5_A','d7_Y','d7_A','d21_Y','d21_A']
diff_subset.to_csv("RNA_transformed_tpm_minus_sva_contribs.subset.averaged.txt",header=True,sep='\t',index=True)
outf=open("RNA_transformed_tpm_minus_sva_contribs.subset.averaged.zscores.txt",'w')
data=open("RNA_transformed_tpm_minus_sva_contribs.subset.averaged.txt",'r').read().strip().split('\n')
outf.write(data[0]+'\n')
for line in data[1::]:
    tokens=line.split('\t')
    vals=[float(i) for i in tokens[1::]]
    mean_vals=mean(vals)
    std_vals=stdev(vals)
    z_vals=[(i-mean_vals)/std_vals for i in vals]
    outf.write(tokens[0]+'\t'+'\t'+'\t'.join([str(i) for i in z_vals])+'\n')
outf.close()
