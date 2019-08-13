#aggregate y vs o differential genes
#find mean expression across reps
#get the fold change of y vs o for differential genes for use in dpgp
import argparse
import pandas as pd
import pdb 

def parse_args():
    parser=argparse.ArgumentParser(description="aggregate differential genes from limma for use in dpgp, david, and heatmap")
    parser.add_argument('--diff_gene_files',nargs="+")
    parser.add_argument('--corrected_tpm_values')
    parser.add_argument('--out_averaged')
    parser.add_argument('--out_fold_change')
    parser.add_argument('--pseudocount',type=float,default=1e-2)
    return parser.parse_args()

def get_diff_gene_names(diff_gene_files):
    gene_names=set([])
    for diff_gene_file in diff_gene_files:
        cur_gene_names=set([i.split('\t')[0] for i in open(diff_gene_file,'r').read().strip().split('\n')])
        gene_names=gene_names.union(cur_gene_names)
    print("got gene names for diff genes") 
    return list(gene_names) 
        

def main():
    args=parse_args()
    genes=pd.read_csv(args.corrected_tpm_values,header=0,sep='\t',index_col=0)

    #get the set of differential genes across one or more conditions
    diff_gene_names=get_diff_gene_names(args.diff_gene_files)

    #filter gene data frame to just differential genes. 
    diff_gene_df=genes[genes.index.isin(diff_gene_names)]
    
    #average across replicates 
    d0_Y=diff_gene_df.filter(regex="d0_Y_Rep").mean(axis=1)
    d0_A=diff_gene_df.filter(regex="d0_A_Rep").mean(axis=1)
    d0_Y_Pax7=diff_gene_df.filter(regex="d0_Y_Pax7_Rep").mean(axis=1)
    d1_Y=diff_gene_df.filter(regex="d1_Y_Rep").mean(axis=1)
    d1_A=diff_gene_df.filter(regex="d1_A_Rep").mean(axis=1)
    d3_Y=diff_gene_df.filter(regex="d3_Y_Rep").mean(axis=1)
    d3_A=diff_gene_df.filter(regex="d3_A_Rep").mean(axis=1)
    d5_Y=diff_gene_df.filter(regex="d5_Y_Rep").mean(axis=1)
    d5_A=diff_gene_df.filter(regex="d5_A_Rep").mean(axis=1)
    d7_Y=diff_gene_df.filter(regex="d7_Y_Rep").mean(axis=1)
    d7_A=diff_gene_df.filter(regex="d7_A_Rep").mean(axis=1)
    diff_subset=pd.concat([d0_Y,d0_A,d0_Y_Pax7,d1_Y,d1_A,d3_Y,d3_A,d5_Y,d5_A,d7_Y,d7_A],axis=1)
    diff_subset.columns=['d0_Y','d0_A','d0_Y_Pax7','d1_Y','d1_A','d3_Y','d3_A','d5_Y','d5_A','d7_Y','d7_A']
    diff_subset.to_csv(args.out_averaged+".with_Pax7",sep='\t',index=True)
    diff_subset=diff_subset.drop('d0_Y_Pax7',axis=1)
    diff_subset.to_csv(args.out_averaged,sep='\t',index=True)
    
    #get the fold change
    d0_Y_vs_A=d0_Y/(d0_A+args.pseudocount)
    d0_Y_Pax7_vs_A=d0_Y_Pax7/(d0_A+args.pseudocount)
    d1_Y_vs_A=d1_Y/(d1_A+args.pseudocount)
    d3_Y_vs_A=d3_Y/(d3_A+args.pseudocount)
    d5_Y_vs_A=d5_Y/(d5_A+args.pseudocount)
    d7_Y_vs_A=d7_Y/(d7_A+args.pseudocount)
    fc_subset=pd.concat([d0_Y_vs_A,d0_Y_Pax7_vs_A,d1_Y_vs_A,d3_Y_vs_A,d5_Y_vs_A,d7_Y_vs_A],axis=1)
    fc_subset.columns=['d0_Y_vs_A','d0_Y_Pax7_vs_A','d1_Y_vs_A','d3_Y_vs_A','d5_Y_vs_A','d7_Y_vsA']
    fc_subset.to_csv(args.out_fold_change+".with_Pax7",sep='\t',index=True)
    fc_subset=fc_subset.drop('d0_Y_Pax7_vs_A',axis=1)
    fc_subset.to_csv(args.out_fold_change,sep='\t',index=True)
  
if __name__=="__main__":
    main()
    
