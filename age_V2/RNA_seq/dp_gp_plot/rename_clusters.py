name_map=open('rename_map.txt','r').read().strip().split('\n')
name_dict=dict()
for line in name_map[1::]:
    tokens=line.split('\t')
    name_dict[tokens[0]]=tokens[1]

ztpm=open('zscores_cluster_specific_diff_genes_reps_averaged.csv','r').read().strip().split('\n')
outf_ztpm=open("tmp.tpm.csv",'w')
header=ztpm[0]
outf_ztpm.write(header+'\n')
for line in ztpm[1::]:
    tokens=line.split('\t')
    old_clust=tokens[0]
    new_clust=name_dict[old_clust]
    outf_ztpm.write(old_clust+'\t'+new_clust+'\t'+'\t'.join(tokens[1::])+'\n')
outf_ztpm.close()

zfc=open('zscores_cluster_specific_diff_genes_reps_averaged_fc.tsv','r').read().strip().split('\n')
outf_zfc=open("tmp.fc.csv",'w')
header=zfc[0]
outf_zfc.write(header+'\n')
for line in zfc[1::]:
    tokens=line.split('\t')
    old_clust=tokens[0]
    new_clust=name_dict[old_clust]
    outf_zfc.write(old_clust+'\t'+new_clust+'\t'+'\t'.join(tokens[1::])+'\n')
    
