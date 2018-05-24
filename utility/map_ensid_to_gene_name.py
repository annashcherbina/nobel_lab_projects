#This script maps ENSEMBL ID's for genes  to common gene names
import argparse
def parse_args():
    parser=argparse.ArgumentParser(description="This script maps ENSEMBL ID's for genes and transcripts to common gene names")
    parser.add_argument("--gtf",default="/data/mm10/Mus_musculus.GRCm38.87.gtf")
    parser.add_argument("--outf",default="/data/mm10/Mus_musculus.GRCm38.87.ID.to.name")
    return parser.parse_args()

def main():
    args=parse_args()
    gtf=open(args.gtf,'r').read().strip().split('\n')
    outf=open(args.outf,'w')
    outf.write('ENSID_gene\tGeneName\n')
    for line in gtf:
        if line.startswith("#"):
            continue
        gene_info=[i.strip() for i in line.split('\t')[-1].split(';')]
        gene_id=None
        gene_name=None
        #print(str(gene_info))
        for entry in gene_info:
            if entry.startswith('gene_id'):
                gene_id=entry.split(' ')[1].strip("\"")
            elif entry.startswith("gene_name"):
                gene_name=entry.split(' ')[1].strip("\"")
        if gene_id==None:
            print(line)
        if gene_name==None:
            print(line) 
        outf.write(gene_id+'\t'+gene_name+'\n')

if __name__=="__main__":
    main()
    
