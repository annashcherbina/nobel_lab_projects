aged=open("aged.csv",'r').read().strip().split('\n')
young=open('young.csv','r').read().strip().split('\n')
outf_young=open('young.v2.csv','w')
outf_young.write(young[0]+'\n')
#make aged dict
aged_dict=dict()
for line in aged:
    tokens=line.split('\t')
    fam=tokens[1]
    classname=tokens[2]
    aged_dict[fam]=classname
for line in young[1::]:
    tokens=line.split('\t')
    if (tokens[-1]!="Unknown"):
        outf_young.write(line+'\n')
    elif tokens[1] in aged_dict:
        tokens[-1]=aged_dict[tokens[1]]
        outf_young.write('\t'.join(tokens)+'\n')
    else:
        print(line)
        outf_young.write(line+'\n')
        
