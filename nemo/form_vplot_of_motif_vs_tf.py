#Expression of TF's with binding motifs enriched from more accessible peaks 

#Specific to individual days 

#All TF's or differential TF's only 
import argparse 
import pdb 
def parse_args(): 
    parser=argparse.ArgumentParser(description="Volcano plot of TF expression vs motif enrichment")
    parser.add_argument("--days",nargs="+",default=["Day0","Day2","Day4","Day7"])
    parser.add_argument("--expression_fc",nargs="+",default=["/srv/gsfs0/projects/kundaje/users/annashch/Dropbox/NEMO_Knockout/Results/Differential_Genes/wt_vs_ko_sat/AllDay0SatKO_vs_Day0SatWT.tsv","/srv/gsfs0/projects/kundaje/users/annashch/Dropbox/NEMO_Knockout/Results/Differential_Genes/wt_vs_ko_sat/AllDay7SatKO_vs_Day7SatWT.tsv","/srv/gsfs0/projects/kundaje/users/annashch/Dropbox/NEMO_Knockout/Results/Differential_Genes/wt_vs_ko_sat/AllDay4SatKO_vs_Day4SatWT.tsv","/srv/gsfs0/projects/kundaje/users/annashch/Dropbox/NEMO_Knockout/Results/Differential_Genes/wt_vs_ko_sat/AllDay2SatKO_vs_Day2SatWT.tsv"]) 
    parser.add_argument("--wt_fpkm",default="/srv/gsfs0/projects/kundaje/users/annashch/Dropbox/NEMO_Knockout/Results/Sat_Cells_With_Day4_Sat2_KO_removed/RSEM.genes.fpkm.gt1.noGm.averagedreps.tsv")
    parser.add_argument("--wt_fpkm_cols",nargs="+",default=[2,4,6,8])
    parser.add_argument("--enriched_motifs",default="/srv/gsfs0/projects/kundaje/users/annashch/Dropbox/NEMO_Knockout/ATAC-Seq/results/homer/control4/knownResults.txt")
    parser.add_argument("--outf",default="volcano_plot_tf_expression_vs_motif_enrichment.tsv") 
    return parser.parse_args() 

def main(): 
    args=parse_args() 
    enriched_motifs=open(args.enriched_motifs,'r').read().strip().split('\n') 
    motif_dict=dict() 
    for line in enriched_motifs[1::]: 
        tokens=line.split('\t') 
        motif_name=tokens[0].split('(')[0] 
        motif_fam=tokens[0].split('(')[1].split(')')[0] 
        logpval=tokens[3] 
        motif_name=motif_name.lower() 
        motif_name=motif_name.replace('-','') 
        motif_dict[motif_name]=[logpval,motif_fam]
    print("read in enriched motifs") 

    gene_dict=dict() 
    for i  in range(len(args.expression_fc)):
        f=args.expression_fc[i]
        cur_day=args.days[i] 
        data=open(f,'r').read().strip().split('\n') 
        for line in data[1::]: 
            tokens=line.split('\t') 
            gene=tokens[-1].split('_')[-1]
            gene=gene.lower() 
            gene=gene.replace('-','')
            #print(str(gene))
            if gene not in motif_dict: 
                continue 
            logfc=tokens[0] 
            if gene not in gene_dict: 
                gene_dict[gene]=dict() 
            gene_dict[gene][cur_day]=[logfc]
    print("read in gene fc values") 
    expression=open(args.wt_fpkm,'r').read().strip().split('\n') 
    for line in expression[1::]: 
        tokens=line.split('\t') 
        gene=tokens[1].lower().replace('-','') 
        if gene not in motif_dict: 
            continue 
        for day_index in range(len(args.wt_fpkm_cols)): 
            index=args.wt_fpkm_cols[day_index] 
            cur_day=args.days[day_index] 
            cur_val=tokens[index]
            try:
                gene_dict[gene][cur_day].append(cur_val) 
            except: 
                pdb.set_trace() 
    print("Writing Output File") 
    outf=open(args.outf,'w') 
    outf.write("Motif\tMotif_Fam\tlog10Pval")
    for day in args.days: 
        outf.write('\t'+day+'_'+'lfc')
        outf.write('\t'+day+'_'+'FPKM')
    outf.write('\n') 
    for gene in motif_dict:  
        try:
            entry=gene+'\t'+motif_dict[gene][0]+'\t'+motif_dict[gene][1]
            for day in args.days: 
                entry=entry+'\t'+gene_dict[gene][day][0]
                entry=entry+'\t'+gene_dict[gene][day][1] 
            outf.write(entry+'\n')
        except: 
            entry=gene+'\t'+motif_dict[gene][0]+'\t'+motif_dict[gene][1]
            print(entry)
            
if __name__=="__main__": 
    main() 
