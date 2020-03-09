data=open('merged.tpm.txt','r').read().strip().split('\n')
seen=dict()
outf=open('merged.tpm.unique.txt','w')
outf.write(data[0]+'\n')
for line in data[1::]:
    tokens=line.split('\t')
    merged='_'.join([tokens[0],tokens[1]])
    if merged in seen:
        continue
    else:
        outf.write(line+'\n')
        seen[merged]=1
outf.close()
