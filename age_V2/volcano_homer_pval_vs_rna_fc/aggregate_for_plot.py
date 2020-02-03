import pdb 
import pandas as pd
import math
import numpy as np

homer=pd.read_csv("homer.motifs.of.interest",header=0,sep='\t')
rna=pd.read_csv("RNA_transformed_tpm_minus_sva_contribs.tfs.txt",header=0,sep='\t')

rna_d0=rna[rna.columns[rna.columns.str.contains(pat = 'd0')]].mean(axis=1)
rna_d0_aged=rna[rna.columns[rna.columns.str.contains(pat='d0_A')]].mean(axis=1)
rna_d0_young=rna[rna.columns[rna.columns.str.contains(pat='d0_Y')]].mean(axis=1)
rna_d0_fc=np.log2(abs(rna_d0_young/rna_d0_aged))


rna_d1=rna[rna.columns[rna.columns.str.contains(pat = 'd1')]].mean(axis=1)
rna_d1_aged=rna[rna.columns[rna.columns.str.contains(pat='d1_A')]].mean(axis=1)
rna_d1_young=rna[rna.columns[rna.columns.str.contains(pat='d1_Y')]].mean(axis=1)
rna_d1_fc=np.log2(abs(rna_d1_young/rna_d1_aged))

rna_d3=rna[rna.columns[rna.columns.str.contains(pat = 'd3')]].mean(axis=1)
rna_d3_aged=rna[rna.columns[rna.columns.str.contains(pat='d3_A')]].mean(axis=1)
rna_d3_young=rna[rna.columns[rna.columns.str.contains(pat='d3_Y')]].mean(axis=1)
rna_d3_fc=np.log2(abs(rna_d3_young/rna_d3_aged))

rna_d5=rna[rna.columns[rna.columns.str.contains(pat = 'd5')]].mean(axis=1)
rna_d5_aged=rna[rna.columns[rna.columns.str.contains(pat='d5_A')]].mean(axis=1)
rna_d5_young=rna[rna.columns[rna.columns.str.contains(pat='d5_Y')]].mean(axis=1)
rna_d5_fc=np.log2(abs(rna_d5_young/rna_d5_aged))

rna_d7=rna[rna.columns[rna.columns.str.contains(pat = 'd7')]].mean(axis=1)
rna_d7_aged=rna[rna.columns[rna.columns.str.contains(pat='d7_A')]].mean(axis=1)
rna_d7_young=rna[rna.columns[rna.columns.str.contains(pat='d7_Y')]].mean(axis=1)
rna_d7_fc=np.log2(abs(rna_d7_young/rna_d7_aged))

genes=[i.lower() for i in list(rna['Gene'])]
gene_df=pd.DataFrame([genes,rna_d0,rna_d0_fc,rna_d1,rna_d1_fc,rna_d3,rna_d3_fc,rna_d5,rna_d5_fc,rna_d7,rna_d7_fc])
gene_df=gene_df.transpose()
gene_df.columns=['genes','rna_d0','rna_d0_fc','rna_d1','rna_d1_fc','rna_d3','rna_d3_fc','rna_d5','rna_d5_fc','rna_d7','rna_d7_fc']

outf=open('volcano_input.txt','w')
outf.write('Family\tMotif\tDay\tRNA_fc_young_over_aged\tRNA_mean\tHOMER_pval_young_over_aged\n')
for index,row in homer.iterrows():
    cur_motif=row['Motif']
    print(cur_motif)
    df_index=gene_df.index[gene_df['genes']==cur_motif].tolist()[0]
    day=0
    cur_rna_d0_fc=gene_df.iloc[df_index]['rna_d0_fc']
    cur_rna_d0_mean=gene_df.iloc[df_index]['rna_d0'] 
    homer_pval_aged=-10*math.log10(row['d0_aged'])
    homer_pval_young=-10*math.log10(row['d0_young'])
    if homer_pval_aged>homer_pval_young:
        homer_pval=-1*homer_pval_aged
    else:
        homer_pval=homer_pval_young
    outf.write(row['Family']+'\t'+cur_motif+'\t'+str(0)+'\t'+str(cur_rna_d0_fc)+'\t'+str(cur_rna_d0_mean)+'\t'+str(homer_pval)+'\n')

    day=1
    cur_rna_d1_fc=gene_df.iloc[df_index]['rna_d1_fc']
    cur_rna_d1_mean=gene_df.iloc[df_index]['rna_d1'] 
    homer_pval_aged=-10*math.log10(row['d1_aged'])
    homer_pval_young=-10*math.log10(row['d1_young'])
    if homer_pval_aged>homer_pval_young:
        homer_pval=-1*homer_pval_aged
    else:
        homer_pval=homer_pval_young
    outf.write(row['Family']+'\t'+cur_motif+'\t'+str(1)+'\t'+str(cur_rna_d1_fc)+'\t'+str(cur_rna_d1_mean)+'\t'+str(homer_pval)+'\n')

    day=3
    cur_rna_d3_fc=gene_df.iloc[df_index]['rna_d3_fc']
    cur_rna_d3_mean=gene_df.iloc[df_index]['rna_d3']
    homer_pval_aged=-10*math.log10(row['d3_aged'])
    homer_pval_young=-10*math.log10(row['d3_young'])
    if homer_pval_aged>homer_pval_young:
        homer_pval=-1*homer_pval_aged
    else:
        homer_pval=homer_pval_young
    outf.write(row['Family']+'\t'+cur_motif+'\t'+str(3)+'\t'+str(cur_rna_d3_fc)+'\t'+str(cur_rna_d3_mean)+'\t'+str(homer_pval)+'\n')
    
    day=5
        
    cur_rna_d5_fc=gene_df.iloc[df_index]['rna_d5_fc']
    cur_rna_d5_mean=gene_df.iloc[df_index]['rna_d5']
    homer_pval_aged=-10*math.log10(row['d5_aged'])
    homer_pval_young=-10*math.log10(row['d5_young'])
    if homer_pval_aged>homer_pval_young:
        homer_pval=-1*homer_pval_aged
    else:
        homer_pval=homer_pval_young
    outf.write(row['Family']+'\t'+cur_motif+'\t'+str(5)+'\t'+str(cur_rna_d5_fc)+'\t'+str(cur_rna_d5_mean)+'\t'+str(homer_pval)+'\n')
    
    day=7
    cur_rna_d7_fc=gene_df.iloc[df_index]['rna_d7_fc']
    cur_rna_d7_mean=gene_df.iloc[df_index]['rna_d7']
    homer_pval_aged=-10*math.log10(row['d7_aged'])
    homer_pval_young=-10*math.log10(row['d7_young'])
    if homer_pval_aged>homer_pval_young:
        homer_pval=-1*homer_pval_aged
    else:
        homer_pval=homer_pval_young
    outf.write(row['Family']+'\t'+cur_motif+'\t'+str(7)+'\t'+str(cur_rna_d7_fc)+'\t'+str(cur_rna_d7_mean)+'\t'+str(homer_pval)+'\n')

    
