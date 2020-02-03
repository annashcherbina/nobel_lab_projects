#annotations are provided in segments of 200 bp, which creates segmentation faults when running bedtools intersect against samples 
import argparse 
def parse_args(): 
    parser=argparse.ArgumentParser(description="collapse chromHMM annotations")
    parser.add_argument("--source_file") 
    parser.add_argument("--outf") 
    return parser.parse_args() 

def main(): 
    args=parse_args()
    outf=open(args.outf,'w') 
    data=open(args.source_file,'r')
    cur_state=None 
    cur_chrom=None 
    cur_start=None 
    cur_end=None
    for line in data: 
        tokens=line.split('\t') 
        chrom_val=tokens[0] 
        start_val=tokens[1] 
        end_val=tokens[2] 
        state=tokens[3] 
        if cur_state==None: 
            cur_state=state 
            cur_start=start_val 
            cur_chrom=chrom_val
            cur_end=end_val
        elif cur_state==state: 
            #check if the chromosome has changed 
            if cur_chrom!=chrom_val: 
                outf.write(cur_chrom+'\t'+cur_start+'\t'+cur_end+'\t'+cur_state+'\n')
                cur_state=state 
                cur_start=start_val 
                cur_chrom=chrom_val                 
                cur_end=end_val 
            else: 
                #nothing to do, keep expanding the location of the current chromatin state
                continue 
        else: 
            #write the interval and reset 
            outf.write(cur_chrom+'\t'+cur_start+'\t'+cur_end+'\t'+cur_state+'\n')
            cur_state=state 
            cur_start=start_val 
            cur_chrom=chrom_val 
            cur_end=end_val

if __name__=="__main__": 
    main()

