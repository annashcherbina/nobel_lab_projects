import argparse
import pandas as pd 
def parse_args():
    parser=argparse.ArgumentParser()
    parser.add_argument("--source_dir",nargs="+")
    parser.add_argument("--thresh",type=float,default=1e-20)
    parser.add_argument("--outf")
    return parser.parse_args()

def main():
    args=parse_args()
    samples=args.source_dir
    motif_dict=dict()
    for sample in samples:
        motifs=pd.read_csv('/'.join([sample,'knownResults.txt']),header=0,sep='\t')
        for index,row in motifs.iterrows():
            motif=row['Motif Name'].split('(')[0]
            pval=float(row['P-value'])
            if pval> args.thresh:
                continue 
            if motif not in motif_dict:
                motif_dict[motif]=dict()
            motif_dict[motif][sample]=row['P-value']
    outf=open(args.outf,'w')
    outf.write('Motif\t'+'\t'.join(samples)+'\n')
    for motif in motif_dict:
        outf.write(motif)
        for sample in samples:
            if sample in motif_dict[motif]:
                outf.write('\t'+str(motif_dict[motif][sample]))
            else:
                outf.write('\t1')
        outf.write('\n')
        
if __name__=="__main__":
    main()
    
