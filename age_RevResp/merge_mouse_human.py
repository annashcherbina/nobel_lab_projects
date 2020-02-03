import pandas as pd
mouse=pd.read_csv("age.rna.counts.tpm.txt",header=0,sep='\t')
human=pd.read_csv("aggregate_external_tpms.txt",header=0,sep='\t')
merged=pd.merge(mouse,human,how='inner',on='Gene')
merged.to_csv("merged.tpm.txt",header=True,index=False,sep='\t')
