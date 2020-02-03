import pandas as pd
import pdb 
data=pd.read_csv("diff_genes_reps_average_fc_young_vs_aged.tsv",header=0,sep='\t',index_col=0)
print(data.head())
stdev=data.std(axis=1)
print(min(stdev))
print(max(stdev))

