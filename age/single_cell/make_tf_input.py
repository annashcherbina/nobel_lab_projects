young_tfs=open("young.tfs.txt",'r').read().strip().split('\n')
aged_tfs=open("aged.tfs.txt",'r').read().strip().split('\n')
anno=open("tf.anno",'r').read().strip().split('\n')

tf_anno_dict=dict()
for line in anno[1::]:
    tokens=line.split('\t')
    tf=tokens[0]
    fam=tokens[1]
    tf_class=tokens[2]
    tf_anno_dict[tf]=[tf,fam,tf_class]+18*["NA"]
print("loaded TF annotation")
for line in young_tfs[1::]:
    tokens=line.split('\t')
    tf=tokens[0]
    try:
        tf_anno_dict[tf][3:12]=tokens[-9::]
    except:
        print(tf)
print("parsed young tfs") 

for line in aged_tfs:
    tokens=line.split('\t')
    tf=tokens[0]
    try:
        tf_anno_dict[tf][12:21]=tokens[-9::]
    except:
        print(tf)
print("parsed aged tfs")

outf=open("summary.young.old.tf.median.vals.txt",'w')
outf.write("TF\tFam\tClass")
for age in ["Y","O"]:
    for metric in ["sum","ave","med"]:
        for day in ["d0","d3","d7"]:
            outf.write('\t'+'_'.join([day,metric,age]))
outf.write('\n') 
for tf in tf_anno_dict:
    cur_vals='\t'.join([str(i) for i in tf_anno_dict[tf]])
    outf.write(cur_vals+'\n')
    
