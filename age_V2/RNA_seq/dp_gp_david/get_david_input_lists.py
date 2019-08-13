data=open("_optimal_clustering.txt",'r').read().strip().split('\n')
out_lists=dict()
for i in range(1,22):
    out_lists[str(i)]=open(str(i)+".cluster",'w')
name_map=open('rename_map.txt','r').read().strip().split('\n')
name_dict=dict()
for line in name_map[1::]:
    tokens=line.split('\t')
    name_dict[tokens[0]]=tokens[1]

for line in data[1::]:
    tokens=line.split('\t')
    cluster=tokens[0]
    new_cluster=name_dict[cluster]
    gene=tokens[1].split('_')[1]
    out_lists[new_cluster].write(gene+'\n')
for i in out_lists:
    out_lists[i].close()
    
