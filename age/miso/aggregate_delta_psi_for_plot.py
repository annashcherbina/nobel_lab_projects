import argparse
def parse_args():
    parser=argparse.ArgumentParser(description="")
    parser.add_argument("--files",nargs="+")
    parser.add_argument("--outf")
    return parser.parse_args()
def main():
    args=parse_args()
    outf=open(args.outf,'w')
    outf.write("AltEvent\tTime\tDiff\n")
    for f in args.files:
        parts=f.split('/')
        alt_event=parts[1]
        day=parts[2].split('.')[0][1]
        values=[i.split('\t')[7].split(',')[0] for i in open(f,'r').read().strip().split('\n')]
        for v in values:
            outf.write(alt_event+'\t'+day+'\t'+v+'\n')

if __name__=="__main__":
    main()
    
