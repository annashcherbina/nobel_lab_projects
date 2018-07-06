#plot the MISO tracks for all significantly differential regions between Injured & Control 
import argparse 
import subprocess
import pdb 
def parse_args(): 
    parser=argparse.ArgumentParser(description="plot differential miso events")
    parser.add_argument("--diff_miso")
    parser.add_argument("--miso_to_gene") 
    parser.add_argument("--index_dir") 
    parser.add_argument("--sashimi_settings")
    parser.add_argument("--output_dir") 
    return parser.parse_args() 

def main(): 
    args=parse_args()
    diff_miso=open(args.diff_miso,'r').read().strip().split('\n') 
    miso_to_gene=open(args.miso_to_gene,'r').read().strip().split('\n') 
    miso_to_gene_dict=dict() 
    for line in miso_to_gene: 
        tokens=line.split('\t') 
        miso_to_gene_dict[tokens[0]]=tokens[1]
    for line in diff_miso[1::]: 
        event=line.split('\t')[0] 
        #plot the event 
        gene=miso_to_gene_dict[event] 
        command=' '.join(["sashimi_plot","--plot-event",event,args.index_dir,args.sashimi_settings,"--output-dir",args.output_dir,"--plot-title",gene+":"+event,"--plot-label", gene+":"+event])
        subprocess.call(command,shell=True)
if __name__=="__main__": 
    main() 

