#Get the percent of peaks in each group that are within 10kb of hg38 TSS (proximal) or further away (distal)
import argparse
import pandas as pd
import pdb

def parse_args():
    parser=argparse.ArgumentParser(description="Get the percent of peaks in each group that are within 10kb of hg38 TSS (proximal) or further away (distal)")
    parser.add_argument("--bedtools_closest_f",nargs="+")
    parser.add_argument("--outf")
    parser.add_argument("--prox_thresh",type=int,default=1000,help="distance cutoff from TSS to determine proximal vs distal")
    return parser.parse_args()

def main():
    args=parse_args()
    outf=open(args.outf,'w')
    outf.write("Sample\tNprox\tNDist\tFractProx\tFractDist\n")
    for f in args.bedtools_closest_f:
        try:
            data=pd.read_csv(f,header=None,sep='\t')
        except:
            continue
        numcol=data.shape[1]
        lastcol_index=numcol-1
        num_prox=data[data[lastcol_index]<=args.prox_thresh].shape[0]
        num_dist=data[data[lastcol_index]>=args.prox_thresh].shape[0]
        total=num_prox+num_dist
        fract_prox=num_prox/total
        fract_dist=num_dist/total
        outf.write(f+'\t'+str(num_prox)+'\t'+str(num_dist)+'\t'+str(fract_prox)+'\t'+str(fract_dist)+'\n')


if __name__=="__main__":
    main()
    
