import pandas as pd
import pdb

data=open("zscores_cluster_specific_diff_genes_reps_averaged.tsv",'r').read().strip().split('\n') 
filter_map=pd.read_csv("cluster_filter_map.txt",header=0,sep='\t')
filter_dict=dict()
for index,row in filter_map.iterrows():
    old=str(int(row['old']))
    new=str(int(row['new']))
    drop=row['drop']
    if drop=="True":
        new=None
    filter_dict[old]=new
print(filter_dict) 
outf=open("filtered.zscores_cluster_specific_diff_genes_reps_averaged.csv",'w')
header=data[0]+'\tfilteredCluster\n'
outf.write(header)
for line in data[1::]:
    tokens=line.split('\t')
    cluster=tokens[0]
    new_cluster=filter_dict[cluster]
    if new_cluster is None:
        continue
    else:
        outf.write(line+'\t'+new_cluster+'\n')
outf.close()


