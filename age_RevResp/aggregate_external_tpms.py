import argparse
def parse_args():
    parser=argparse.ArgumentParser(description="aggregate external datasets")
    parser.add_argument("--samples",nargs="+")
    parser.add_argument("--outf")
    parser.add_argument("--genemap",default="map.txt")
    return parser.parse_args()

def main():
    args=parse_args()
    sample_names=set([])
    vals=dict()
    gene_map=open(args.genemap,'r').read().strip().split('\n') 
    gene_map_dict=dict()
    for line in gene_map:
        tokens=line.split('\t')
        gene_id=tokens[0]
        gene_name=tokens[1]
        gene_map_dict[gene_id]=gene_name 
    
    for sample in args.samples:
        data=open(sample,'r').read().strip().split('\n')
        sample_name=sample.split('.')[0]
        sample_names.add(sample_name) 
        for line in data[1::]:
            tokens=line.split('\t')
            gene_id=tokens[0]
            tpm=tokens[1]
            if gene_id not in vals:
                vals[gene_id]=dict()
            vals[gene_id][sample_name]=tpm
        print("processed "+sample_name)
    outf=open(args.outf,'w')
    sample_names=list(sample_names)
    outf.write('GeneID\tGene')
    for sample_name in sample_names:
        outf.write('\t'+sample_name)
    outf.write('\n')
    for gene_id in vals:
        try:
            gene_name=gene_map_dict[gene_id]
        except:
            gene_name="None"
            print(gene_id)
        outf.write(gene_id+'\t'+gene_name)
        for sample in sample_names:
           outf.write('\t'+vals[gene_id][sample])
        outf.write('\n')
    outf.close()

if __name__=="__main__":
    main()
    
        
    
