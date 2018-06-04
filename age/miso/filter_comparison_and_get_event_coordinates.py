#filter miso comparisons by bayes factor and psi 
#write the chrom,start,end,event annotation to use with mapping to genes 
import argparse 
def parse_args(): 
    parser=argparse.ArgumentParser(description="filter miso comparisons by bayes factor and psi; write the chrom start, end, event annotation in bed format to use with mapping to genes")
    parser.add_argument("--bf_file") 
    parser.add_argument("--diff_thresh",type=float,default=0.20) 
    parser.add_argument("--bayes_thresh",type=float,default=10) 
    parser.add_argument("--count_thresh",type=float,default=10) 
    parser.add_argument("--event_index",type=int,default=0) 
    parser.add_argument("--diff_index",type=int,default=7) 
    parser.add_argument("--bayes_index",type=int,default=8)
    parser.add_argument("--count_sample1",type=int,default=11) 
    parser.add_argument("--count_sample2",type=int,default=13) 
    parser.add_argument("--out_dir") 
    return parser.parse_args() 

def main(): 
    args=parse_args() 
    outf=open(args.out_dir+"/filtered",'w')
    bedf=open(args.out_dir+"/filtered.events.bed",'w')
    data=open(args.bf_file,'r').read().strip().split('\n') 
    outf.write(data[0]+'\n') 
    for line in data[1::]: 
        tokens=line.split('\t')
        event=tokens[args.event_index] 
        diff=max([abs(float(i)) for i in tokens[args.diff_index].split(',')])
        bayes=max([float(i) for i in tokens[args.bayes_index].split(',')])
        counts1=sum([float(i.split(':')[1]) for i in tokens[args.count_sample1].split(',')])
        counts2=sum([float(i.split(':')[1]) for i in tokens[args.count_sample2].split(',')])
        if abs(diff)>=args.diff_thresh: 
            if bayes > args.bayes_thresh: 
                if counts1 > args.count_thresh: 
                    if counts2 > args.count_thresh: 
                        #passes our filters! Keep this event 
                        outf.write(line+'\n') 
                        chrom=tokens[-4].replace('chr','')  
                        start_pos=min([int(i) for i in tokens[-2].split(',')])
                        end_pos=max([int(i) for i in tokens[-1].split(',')])
                        bedf.write(chrom+'\t'+str(start_pos)+'\t'+str(end_pos)+'\t'+event+'\n')


if __name__=="__main__": 
    main() 

