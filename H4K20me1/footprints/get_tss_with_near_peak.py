import pandas as pd
old=pd.read_csv("Old.distance.bed",header=None,sep='\t')
old=old[old[15]<5000]
old_coord=old[[9,10,11]]
old_coord=old_coord.drop_duplicates() 
old_coord.to_csv("Old.tss.near.peaks.bed",header=False,index=False,sep='\t')


young=pd.read_csv("Young.distance.bed",header=None,sep='\t')
young=young[young[15]<5000]
young_coord=young[[9,10,11]]
young_coord=young_coord.drop_duplicates() 
young_coord.to_csv("Young.tss.near.peaks.bed",header=False,index=False,sep='\t')

