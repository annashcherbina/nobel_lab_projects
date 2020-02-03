import argparse

def parse_args(): 
    parser=argparse.ArgumentParser(description="prepare inputs for chromHMM histogram")
    parser.add_argument("--intersections",nargs="+")
    parser.add_argument("--out_prefix")
    return parser.parse_args()

def main():
    args=parse_args()
    outf=open(args.out_prefix,'w')
    intersection_dict=dict()
    states=set([])
    
    for f in args.intersections:
        data=open(f,'r').read().strip().split('\n')
        intersection_dict[f]=dict()
        for line in data:
            tokens=line.split('\t')
            state=tokens[6]
            if state==".":
                state='15_Quies'
            states.add(state) 
            if state not in intersection_dict[f]:
                intersection_dict[f][state]=1
            else:
                intersection_dict[f][state]+=1
    files=list(intersection_dict.keys())
    outf.write('\t'+'\t'.join(files)+'\n')
    for state in states:
        outf.write(state)
        for filename in files:
            if state in intersection_dict[filename]:
                outf.write('\t'+str(intersection_dict[filename][state]))
            else:
                outf.write('\t0')
        outf.write('\n')

if __name__=="__main__":
    main()
    
