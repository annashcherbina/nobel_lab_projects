import pandas as pd
mouse=pd.read_csv("age.rna.counts.goodreps.txt.tpm",header=0,sep='\t')
human=pd.read_csv("aggregate_external_tpms.txt",header=0,sep='\t')
merged=pd.merge(mouse,human,how='inner',on='GENE')
merged.to_csv("merged.tpm.txt",header=True,index=False,sep='\t')
