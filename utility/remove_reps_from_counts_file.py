#removes the specified replicates from the counts file, replicates are id'ed by column headers
import argparse
def parse_args():
    parser=argparse.ArgumentParser(description="removes the specified replicates from the counts file, replicates are id'ed by column headers")
    parser.add_argument("--to_remove",nargs="+")
    parser.add_argument("--source_f",nargs="+")
    parser.add_argument("--out_f",nargs="+")
    return parser.parse_args()

def main():
    args=parse_args()
    for z in range(len(args.source_f)):
        data_f=args.source_f[z]
        outf=open(args.out_f[z],'w')
        data=open(data_f,'r').read().strip().split('\n')
        header=data[0].split()
        to_keep=[]
        to_remove=args.to_remove
        for i in range(len(header)):
            entry=header[i]
            if entry in to_remove:
                continue
            else:
                to_keep.append(i)
        
        for line in data:
            tokens=line.split('\t')
            outf.write('\t'.join([tokens[i] for i in to_keep])+'\n')
if __name__=="__main__":
    main()
    
