#prepares inputs for k-means clustering analysis.
diff_peaks=open("NEMO_Control_4.tsv",'r').read().strip().split('\n')
diff_peak_dict=dict()
for line in diff_peaks[1::]:
    tokens=line.split('\t')
    diff_peak_dict[tuple(tokens[0:3])]=1
print("hashed list of differential peaks") 
cpm=open("log2_counts_per_million_nemo_control4.tsv",'r').read().strip().split('\n')
outf=open("kmeans_inputs.tsv",'w')
outf.write("Peak\tNEMO_1\tNEMO_2\tNEMO_3\tNEMO_4\tNEMO_5\tNEMO_6\tNEMO_7\tNEMO_8\tControl_1\tControl_2\tControl_3\tControl4\n")
for line in cpm:
    tokens=line.split('\t')
    entry=tuple(tokens[0:3])
    if entry in diff_peak_dict:
        outf.write('_'.join(entry)+'\t'+'\t'.join(tokens[3::])+'\n')
