for i in range(1,22):
    data=open(str(i)+'.DAVID.txt','r').read().strip().split('\n')
    outf=open(str(i)+'.DAVID.fdr0.05.txt','w')
    outf.write(data[0]+'\n')
    for line in data[1::]: 
        tokens=line.split('\t')
        fdr=float(tokens[-1])
        if fdr<=0.05:
            outf.write(line+'\n')
    outf.close()
    
