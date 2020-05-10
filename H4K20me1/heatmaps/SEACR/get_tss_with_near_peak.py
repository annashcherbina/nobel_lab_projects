import pandas as pd


old=pd.read_csv("old.seacr.distance.bed",header=None,sep='\t')
old=old[old[9]<5000]
old_coord=old[[6,7,8]]
old_coord=old_coord.drop_duplicates() 
old_coord.to_csv("old.seacr.tss.near.peaks.bed",header=False,index=False,sep='\t')

young=pd.read_csv("young.seacr.distance.bed",header=None,sep='\t')
young=young[young[9]<5000]
young_coord=young[[6,7,8]]
young_coord=young_coord.drop_duplicates() 
young_coord.to_csv("young.seacr.tss.near.peaks.bed",header=False,index=False,sep='\t')

