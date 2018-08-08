#there are too many peaks to run dpgp directly.
#consequently each peak gets assigned to a specific trajectory (1,0,-1 at days 0,1,3,5,7)
#The inputs to DPGP are the mean fold change of Young/Old for each tracjectory.
import argparse
import pandas as pd
import numpy as np

import pdb

def parse_args():
    parser=argparse.ArgumentParser(description="#there are too many peaks to run dpgp directly.#consequently each peak gets assigned to a specific trajectory (1,0,-1 at days 0,1,3,5,7)#The inputs to DPGP are the mean fold change of Young/Old for each tracjectory.")
    parser.add_argument("--limma_diff_files",nargs="+")
    parser.add_argument("--timepoints",nargs="+")
    parser.add_argument("--fc_file")
    parser.add_argument("--diff_bed") 
    parser.add_argument("--outf")
    return parser.parse_args()

def main():
    args=parse_args()
    trajectory_dict=dict()
    peak_to_trajectory=dict() 
    diff_peaks=dict()
    diff_bed=pd.read_csv(args.diff_bed,index_col=0)
    fc_file=pd.read_csv(args.fc_file,index_col=0,sep='\t')
    for i in range(len(args.timepoints)):
        cur_timepoint=args.timepoints[i]
        cur_limma_data=pd.read_csv(args.limma_diff_files[i],sep='\t',header=0,index_col="Gene")
        diff_peaks[cur_timepoint]=cur_limma_data
    outf_peak_to_trajectory=open(args.outf+".peak_to_trajectory",'w')
    outf=open(args.outf,'w')
    outf.write('Trajectory\t'+'\t'.join(args.timepoints)+'\n')
    for peak in diff_bed.index:
        cur_trajectory=[]
        cur_fc=[] 
        for cur_timepoint in args.timepoints:
            try:
                foldchange=diff_peaks[cur_timepoint].loc[peak][0]
                if foldchange >0:
                    cur_trajectory.append(1)
                else:
                    cur_trajectory.append(-1)
            except:
                cur_trajectory.append(0)
        cur_trajectory='_'.join([str(i) for i in cur_trajectory])
        #write the mapping of peak to trajectory
        outf_peak_to_trajectory.write(peak+'\t'+cur_trajectory+'\n')
        fc_vals=fc_file.loc[peak]
        if cur_trajectory not in trajectory_dict:
            trajectory_dict[cur_trajectory]=[fc_vals]
        else:
            trajectory_dict[cur_trajectory].append(fc_vals)
        peak_to_trajectory[peak]=cur_trajectory
        
    print("getting mean trajectories across timepoints") 
    #get mean trajectory fc across timepoints
    for trajectory in trajectory_dict:
        cur_vals=np.asarray(trajectory_dict[trajectory])
        n_timepoints=len(args.timepoints)
        fc_vals=[] 
        for tp in range(n_timepoints):
            cur_fc=np.mean(cur_vals[:,n_timepoints+tp]/cur_vals[:,tp])
            fc_vals.append(cur_fc) 
        outf.write(trajectory+'\t'+'\t'.join([str(i) for i in fc_vals])+'\n')
        
if __name__=="__main__":
    main()
    
