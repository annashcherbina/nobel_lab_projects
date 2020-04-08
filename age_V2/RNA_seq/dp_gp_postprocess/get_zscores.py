from statistics import mean,stdev 
data=open("cluster_specific_diff_genes_reps_averaged.tsv",'r').read().strip().split('\n')
outf=open("zscores_cluster_specific_diff_genes_reps_averaged.tsv",'w')
outf.write(data[0]+'\n')
for line in data[1::]:
    tokens=line.split('\t')
    vals=[float(i) for i in tokens[2::]]
    mean_vals=mean(vals)
    std_vals=stdev(vals)
    z_vals=[(i-mean_vals)/std_vals for i in vals]
    outf.write(tokens[0]+'\t'+tokens[1]+'\t'+'\t'.join([str(i) for i in z_vals])+'\n')
outf.close()
data=open("cluster_specific_diff_genes_reps_averaged_fc.tsv",'r').read().strip().split('\n')
outf=open("zscores_cluster_specific_diff_genes_reps_averaged_fc.tsv",'w')
outf.write(data[0]+'\n')
for line in data[1::]:
    tokens=line.split('\t')
    vals=[float(i) for i in tokens[2::]]
    mean_vals=mean(vals)
    std_vals=stdev(vals)
    z_vals=[(i-mean_vals)/std_vals for i in vals]
    outf.write(tokens[0]+'\t'+tokens[1]+'\t'+'\t'.join([str(i) for i in z_vals])+'\n')
outf.close()

