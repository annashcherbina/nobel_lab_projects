import sys
#data=open("RSEM.genes.fpkm.gt1.noGm.tsv",'r').read().strip().split('\n')
data=open("RSEM.genes.expected_count.gt1.noGm.csv",'r').read().strip().split('\n') 
outf=open("tmp",'w')
outf.write(data[0]+'\n')
for line in data[1::]:
    tokens=line.split('\t')
    if len(tokens)<5:
        print(str(tokens))
        continue 
    vals=[float(i) for i in tokens[2::]]
    maxval=max(vals)
    if maxval >=1:
        outf.write(line+'\n')
        
