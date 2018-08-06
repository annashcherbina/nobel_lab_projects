#add annotation from sup table 1 & sup table 2 
young=open("young.sig_tf_names_qval0.01.txt.tofamily",'r').read().strip().split('\n')
aged=open("aged.sig_tf_names_qval0.01.txt.tofamily",'r').read().strip().split('\n')
sup1=open("sup_1.csv",'r').read().strip().split('\n')
sup2=open("sup_2.csv",'r').read().strip().split('\n')
print("read tables")
sup1_dict=dict()
for line in sup1[2::]:
    tokens=line.split('\t')
    tf=tokens[1]
    fam=tokens[2]
    sup1_dict[tf.lower()]=fam
sup2_dict=dict()
for line in sup2[1::]:
    tokens=line.split('\t')
    fam=tokens[0]
    tf=tokens[1].split('_')[0].split(' ')[0].split('$')[-1]
    sup2_dict[tf.lower()]=fam
    
outf=open('young.extra_anno','w')
outf.write(young[0]+'\n')
hits=0
for line in young[1::]:
    tokens=line.split('\t')
    dbd=tokens[-1].lower()
    if dbd!="unknown":
        outf.write(line+'\n')
        continue
    found=0
    tf_name=tokens[0].lower()
    if tf_name in sup1_dict:
        dbd=sup1_dict[tf_name]
        found=1
        if tf_name in sup2_dict:
            dbd=dbd+'/'+sup2_dict[tf_name]
    else:
        if tf_name in sup2_dict:
            dbd=sup2_dict[tf_name]
            found=1
    if(found==1):
        hits+=1
    outf.write(tokens[0]+'\t'+tokens[1]+'\t'+dbd+'\n')
    
outf=open('aged.extra_anno','w')
outf.write(aged[0]+'\n')
for line in aged[1::]:
    tokens=line.split('\t')
    dbd=tokens[-1].lower()
    if dbd!="unknown":
        outf.write(line+'\n')
        continue
    found=0
    tf_name=tokens[0].lower()
    if tf_name in sup1_dict:
        dbd=sup1_dict[tf_name]
        found=1
        if tf_name in sup2_dict:
            dbd=dbd+'/'+sup2_dict[tf_name]
    else:
        if tf_name in sup2_dict:
            dbd=sup2_dict[tf_name]
            found=1
    if(found==1):
        hits+=1    
    outf.write(tokens[0]+'\t'+tokens[1]+'\t'+dbd+'\n')
print(str(hits))
