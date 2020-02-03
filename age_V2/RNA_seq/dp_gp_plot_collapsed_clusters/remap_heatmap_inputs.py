import pandas as pd
import pdb

data=pd.read_csv("zscores_cluster_specific_diff_genes_reps_averaged.csv",header=0,sep='\t')
filter_map=pd.read_csv("cluster_filter_map.txt",header=0,sep='\t',index_col=['old'])
filter_map=filter_map.drop(['drop'],axis=1)
filter_dict=filter_map.to_dict()['new']
filtered_clusters=[filter_dict[i] for i in data['newCluster']]
data['filteredCluster']=filtered_clusters
data=data[~data.filteredCluster.isnull()]
data.to_csv("filtered.zscores_cluster_specific_diff_genes_reps_averaged.csv",header=True,sep='\t',index=False)

