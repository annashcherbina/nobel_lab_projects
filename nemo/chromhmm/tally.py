import pandas as pd
import argparse
import pdb

def parse_args():
    parser=argparse.ArgumentParser(description="chromHMM annotation tally for multiple input files")
    parser.add_argument("--input_bed",nargs="+")
    parser.add_argument("--outf")
    parser.add_argument("--color_to_state")
    return parser.parse_args()

def main():
    args=parse_args()
    state_dict=dict()
    states=set([])
    color_dict=dict()
    colors=pd.read_table(args.color_to_state,header=0,sep='\t')
    #pdb.set_trace() 
    for index,row in colors.iterrows():
        state=row['State']
        color=row['Color']
        color_dict[color]=state
    print(str(color_dict))
    input_bed=args.input_bed
    for f in input_bed:
        data=pd.read_table(f,header=None)
        state_dict[f]=dict(data[3].value_counts())
        states=states.union(set(state_dict[f].keys()))

    outf=open(args.outf,'w')
    outf.write('State\t'+'\t'.join(input_bed)+'\n')
    for state in states:
        outf.write(color_dict[state])
        for f in input_bed:
            if state in state_dict[f]:
                outf.write('\t'+str(state_dict[f][state]))
            else:
                outf.write('\t0')
        outf.write('\n')
        
        
if __name__=="__main__":
    main()
    
