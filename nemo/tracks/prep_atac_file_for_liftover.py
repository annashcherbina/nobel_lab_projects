source=open("NEMO_Control_4.tsv",'r').read().strip().split('\n') 
outf=open("NEMO_Control_4_for_liftover.tsv",'w') 
for line in source: 
    tokens=line.split('\t') 
    outf.write(tokens[0]+":"+tokens[1]+"-"+tokens[2]+'\n')
    

