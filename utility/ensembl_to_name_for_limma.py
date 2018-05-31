#annotate gene id entries from limma w/ gene names
import argparse
def parse_args():
    parser=argparse.ArgumentParser(description="annotate gene id entries from limma w/ gene names")
    parser.add_argument("--gene_id_to_name",default="/data/mm10/Mus_musculus.GRCm38.87.ID.to.name")
    parser.add_argument("--data_f")
    return parser.parse_args()

def main():
    args=parse_args()

    #generate the gene id to gene name map
    gene_id_to_name_f=open(args.gene_id_to_name,'r').read().strip().split('\n')
    gene_id_to_name=dict()
    for entry in gene_id_to_name_f:
        tokens=entry.split('\t')
        gene_id=tokens[0]
        gene_name=tokens[1]
        gene_id_to_name[gene_id]=gene_name
    print("generated dictionary of gene id to gene name")
    
    
    outf=open(args.data_f+".withname",'w')
    data=open(args.data_f,'r').read().strip().split('\n')
    header=data[0]
    outf.write(header+'\tGeneName\n')
    for line in data[1::]:
        tokens=line.split('\t')
        gene_id=tokens[-1]
        gene_name=gene_id_to_name[gene_id]
        outf.write(line+'\t'+gene_name+'\n')
        
        
        

if __name__=="__main__":
    main()
    
