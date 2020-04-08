import pandas as pd 
data=pd.read_csv("filtered.zscores_cluster_specific_diff_genes_reps_averaged.csv",header=0,sep='\t')
cluster_to_genes={}
for index,row in data.iterrows():
    gene=row['Gene'].split('_')[-1]
    cluster=row['filteredCluster']
    if cluster not in cluster_to_genes:
        cluster_to_genes[cluster]=[gene]
    else:
        cluster_to_genes[cluster].append(gene)
for cluster in cluster_to_genes:
    outf=open(str(cluster)+".genes.txt",'w')
    outf.write('\n'.join(cluster_to_genes[cluster]))
    outf.close()
    
    
