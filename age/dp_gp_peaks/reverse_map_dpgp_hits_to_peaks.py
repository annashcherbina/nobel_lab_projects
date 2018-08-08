import argparse
def parse_args():
    parser=argparse.ArgumentParser(description="reverse map dpgp pattern optimal clusters to peaks")
    parser.add_argument("--optimal_clustering")
    parser.add_argument("--pattern_to_peak_map")
    parser.add_argument("--outf")
    return parser.parse_args()

def main():
    args=parse_args()
    pattern_to_peak_map=open(args.pattern_to_peak_map,'r').read().strip().split('\n')
    trajectories=dict()
    for line in pattern_to_peak_map:
        tokens=line.split()
        peak='\t'.join(tokens[0].split('_'))
        pattern=tokens[1]
        if pattern not in trajectories:
            trajectories[pattern]=[peak]
        else:
            trajectories[pattern].append(peak)
    optimal_clustering=open(args.optimal_clustering,'r').read().strip().split('\n')
    clusters=set([])
    cluster_dict=dict() 
    for line in optimal_clustering[1::]:
        tokens=line.split('\t')
        cluster=tokens[0]
        pattern=tokens[1]
        clusters.add(cluster)
        if cluster not in cluster_dict:
            cluster_dict[cluster]=[]
        cluster_dict[cluster]=cluster_dict[cluster]+trajectories[pattern]
    for cluster in clusters:
        outf=open(args.outf+'.'+str(cluster),'w')
        outf.write('\n'.join(cluster_dict[cluster])+'\n')
        
if __name__=="__main__":
    main()
    
    
