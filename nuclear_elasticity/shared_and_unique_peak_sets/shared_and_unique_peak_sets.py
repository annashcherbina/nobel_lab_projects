import argparse
import pdb 
from pybedtools import BedTool
def parse_args():
    parser=argparse.ArgumentParser(description="Identify peak sets shared by all samples and unique to each sample")
    parser.add_argument("--naive_overlap_sorted_merged",help="final peak set across all samples")
    parser.add_argument("--sample_optimal_sets",nargs='+') 
    parser.add_argument("--outf_prefix")
    return parser.parse_args()

def main():
    args=parse_args()
    naive_overlap_sorted_merged=BedTool(args.naive_overlap_sorted_merged)
    sample_optimal_sets=list(args.sample_optimal_sets)
    num_samples=len(sample_optimal_sets)
    sample_bedtools=[BedTool(i) for i in sample_optimal_sets]
    region_to_sample=dict()
    for sample_index in range(len(sample_bedtools)):
        sample=sample_bedtools[sample_index]
        sample_name=sample_optimal_sets[sample_index]
        print(sample_name) 
        #intersect with the naive_overlap_sorted_merged peak set
        intersections=naive_overlap_sorted_merged.intersect(sample,wa=True)
        for intersection in intersections:
            str_intersection=str(intersection)
            if str_intersection not in region_to_sample:
                region_to_sample[str_intersection]=[sample_name]
            else:
                region_to_sample[str_intersection].append(sample_name)
    output_files=dict()
    output_files['shared']=open(args.outf_prefix+".shared",'w')
    for sample_name in sample_optimal_sets:
        output_files[sample_name]=open(args.outf_prefix+"."+sample_name,'w')
    for region in region_to_sample:
        if len(region_to_sample[region])==1:
            #unique to one sample
            cur_sample =region_to_sample[region][0]
            output_files[cur_sample].write(region)
        elif len(region_to_sample[region])==num_samples:
            output_files['shared'].write(region)
            
        

if __name__=="__main__":
    main()
    
