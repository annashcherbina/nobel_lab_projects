import argparse

def parse_args(): 
    parser=argparse.ArgumentParser(description="prepare inputs for chromHMM histogram")
    parser.add_argument("--young_intersections",nargs="+")
    parser.add_argument("--old_intersections",nargs="+")
    parser.add_argument("--out_prefix")
    return parser.parse_args()

def main():
    args=parse_args()
    outf_young=open(args.out_prefix+'.upinyoung','w')
    outf_old=open(args.out_prefix+'.upinold','w')
    young_dict=dict()
    old_dict=dict()
    states=set(['none'])
    for f in args.young_intersections:
        data=open(f,'r').read().strip().split('\n')
        young_dict[f]=dict()
        young_dict[f]['none']=0 
        for line in data:
            tokens=line.split('\t')
            state=tokens[6]
            if state==".":
                young_dict[f]['none']+=1 
                continue
            states.add(state) 
            if state not in young_dict[f]:
                young_dict[f][state]=1
            else:
                young_dict[f][state]+=1
    for f in args.old_intersections:
        data=open(f,'r').read().strip().split("\n") 
        old_dict[f]=dict()
        old_dict[f]['none']=0
        for line in data:
            tokens=line.split('\t')
            state=tokens[6]
            if state==".":
                old_dict[f]['none']+=1
                continue
            states.add(state) 
            if state not in old_dict[f]:
                old_dict[f][state]=1
            else:
                old_dict[f][state]+=1
    files_young=list(young_dict.keys())
    outf_young.write('\t'+'\t'.join(files_young)+'\n')
    for state in states:
        outf_young.write(state)
        for filename in files_young:
            if state in young_dict[filename]:
                outf_young.write('\t'+str(young_dict[filename][state]))
            else:
                outf_young.write('\t0')
        outf_young.write('\n')
    files_old=list(old_dict.keys())
    outf_old.write('\t'+'\t'.join(files_old)+'\n')
    for state in states:
        outf_old.write(state)
        for filename in files_old:
            if state in old_dict[filename]:
                outf_old.write('\t'+str(old_dict[filename][state]))
            else:
                outf_old.write('\t0')
        outf_old.write('\n')

if __name__=="__main__":
    main()
    
