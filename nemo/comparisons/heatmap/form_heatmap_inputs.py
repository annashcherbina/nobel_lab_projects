import argparse
def parse_args():
    parser=argparse.ArgumentParser(description="generate heatmap inputs")
    parser.add_argument("--inputf",nargs="+")
    parser.add_argument("--outf")
    return parser.parse_args()

def main():
    args=parse_args()
    timepoints=args.inputf
    gene_dict=dict()
    outf=open(args.outf,'w')
    outf.write('Gene'+'\t'.join(timepoints)+'\n')
    for t in timepoints:
        data=open(t,'r').read().strip().split('\n')
        for line in data[1::]:
            tokens=line.split()
            gene=tokens[-1].split('_')[1].replace('"','') 
            lfc=tokens[0]
            if gene not in gene_dict:
                gene_dict[gene]=dict()
            gene_dict[gene][t]=lfc
    for gene in gene_dict:
        outf.write(gene)
        for t in timepoints:
            if t in gene_dict[gene]:
                outf.write('\t'+str(gene_dict[gene][t]))
            else:
                outf.write('\t0')
        outf.write('\n')
        
if __name__=="__main__":
    main() 
