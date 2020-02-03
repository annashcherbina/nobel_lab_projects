import pandas as pd
data=pd.read_csv("filtered.zscores_cluster_specific_diff_genes_reps_averaged_fc.csv",header=0,sep='\t')
data=data.drop(['Cluster','Gene','newCluster'],axis=1)
dmeans=dict() 
dstdev=dict() 
for i in range(1,11):
    subset=data[data['filteredCluster']==i]
    cur_means=subset.mean(axis=0)
    cur_stdev=subset.std(axis=0)
    dmeans[i]=cur_means
    dstdev[i]=cur_stdev
fmeans=pd.DataFrame(dmeans).T
fstdev=pd.DataFrame(dstdev).T
fmeans.to_csv("filtered.zscore_fc_means.tsv",sep='\t',index=True)
fstdev.to_csv("filtered.zscore_fc_stdev.tsv",sep='\t',index=True)


