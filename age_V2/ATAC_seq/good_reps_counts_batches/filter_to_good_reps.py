import argparse
import pandas as pd
import pdb 
def parse_args():
    parser=argparse.ArgumentParser(description="filter to a subset of replicates in the counts and batches files")
    parser.add_argument("--counts_file")
    parser.add_argument("--batches_file")
    parser.add_argument("--samples_to_keep")
    parser.add_argument("--outf_filtered_counts_file")
    parser.add_argument("--outf_filtered_batches_file")
    return parser.parse_args()

def main():
    args=parse_args()
    samples_to_keep=open(args.samples_to_keep,'r').read().strip().split('\n')
    counts=pd.read_csv(args.counts_file,header=0,sep='\t')    
    batches=pd.read_csv(args.batches_file,header=0,sep='\t')
    #filter the counts file
    filtered_counts=counts[['chrom','start','end']+samples_to_keep]
    filtered_batches=batches[batches['Rep'].isin(samples_to_keep)]
    #sanity check
    print("n samples to keep:"+str(len(samples_to_keep)))
    print("filtered_batches.shape:"+str(filtered_batches.shape))
    print("filtered_counts.shape:"+str(filtered_counts.shape))
    filtered_counts.to_csv(args.outf_filtered_counts_file,sep='\t',index=False)
    filtered_batches.to_csv(args.outf_filtered_batches_file,sep='\t',index=False)
    
if __name__=="__main__":
    main()

    
