#splits expression & fold change by cluster.
clusters=open("_optimal_clustering.txt",'r').read().strip().split('\n')
cluster_dict=dict()
for line in clusters[1::]:
    tokens=line.split('\t')
    cluster_dict[tokens[1]]=tokens[0]
print("made optimal cluster dict")
av_tpm=open("diff_genes_reps_averaged.tsv",'r').read().strip().split('\n')
print("read in tpm vals")
av_fc=open("diff_genes_reps_average_fc_young_vs_aged.tsv",'r').read().strip().split('\n')
print("read in fc vals") 
cluster_to_tpm=dict()
cluster_to_fc=dict() 
header_tpm=av_tpm[0]
header_fc=av_fc[0] 
for line in av_tpm[1::]:
    tokens=line.split('\t')
    gene=tokens[0]
    cur_cluster=cluster_dict[gene]
    if cur_cluster not in cluster_to_tpm:
        cluster_to_tpm[cur_cluster]=[line]
    else:
        cluster_to_tpm[cur_cluster].append(line)
for line in av_fc[1::]:
    tokens=line.split('\t')
    gene=tokens[0]
    cur_cluster=cluster_dict[gene]
    if cur_cluster not in cluster_to_fc:
        cluster_to_fc[cur_cluster]=[line]
    else:
        cluster_to_fc[cur_cluster].append(line)
        
outf_tpm=open("cluster_specific_diff_genes_reps_averaged.tsv",'w')
outf_tpm.write("Cluster\tGene\t"+header_tpm+"\n")
for cluster in cluster_to_tpm:
    for entry in cluster_to_tpm[cluster]:
        outf_tpm.write(cluster+'\t'+entry+'\n')
outf_fc=open("cluster_specific_diff_genes_reps_averaged_fc.tsv",'w')
outf_fc.write("Cluster\tGene\t"+header_fc+"\n")
for cluster in cluster_to_fc:
    for entry in cluster_to_fc[cluster]:
        outf_fc.write(cluster+'\t'+entry+'\n')
        

