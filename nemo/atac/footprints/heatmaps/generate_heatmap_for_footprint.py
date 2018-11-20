import pandas as pd
import argparse
def parse_args():
    parser=argparse.ArgumentParser(description="generate heatmap for footprint")
    parser.add_argument("--coverage_files",nargs="+")
    parser.add_argument("--outf")
    return parser.parse_args()

def main():
    args=parse_args()
    counts=dict()
    
    min_pos=None
    max_pos=None
    
    for fname in args.coverage_files:
        data=pd.read_table(fname,header=None,sep='\t')
        for index,row in data.iterrows():
            region=tuple(row[0:3])
            pos=row[3]
            if min_pos==None:
                min_pos=pos
            elif pos < min_pos:
                min_pos=pos
            if max_pos==None:
                max_pos=pos
            elif pos > max_pos:
                max_pos=pos
            coverage=row[4]
            if region not in counts:
                counts[region]=dict()
            if pos not in counts[region]:
                counts[region][pos]=coverage
            else:
                counts[region][pos]+=coverage 
        print("processed:"+fname)
    outf=open(args.outf,'w')
    outf.write('Region\t'+'\t'.join([str(i) for i in range(min_pos,max_pos+1)])+'\n')
    for region in counts:
        outf.write('_'.join([str(i) for i in region]))
        for pos in range(min_pos,max_pos+1):
            outf.write('\t'+str(counts[region][pos]))
        outf.write('\n')
if __name__=="__main__":
    main()
    
