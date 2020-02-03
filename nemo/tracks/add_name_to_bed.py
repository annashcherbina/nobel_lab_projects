source=open("NEMO_Control_4_for_liftover.tsv",'r').read().strip().split('\n') 
index=0 
outf=open('tmp','w')
for line in source: 
    tokens=line.split('\t') 
    entry=tokens[0]+'\t'+tokens[1]+'\t'+tokens[2]+'\t'+str(index)+'_'+tokens[-1]
    index+=1
    outf.write(entry+'\n') 



