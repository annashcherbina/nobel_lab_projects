gtf=open("hg38.geneid.to.name.txt",'r').read().strip().split('\n')
outf=open("map.txt",'w')
for line in gtf:
    tokens=line.split(';')
    gene_id=None
    gene_name=None
    for token in tokens:
        token=token.strip(' ')
        print(token)
        if token.startswith('gene_id'):
            gene_id=token.split('"')[1]
        elif token.startswith('gene_name'):
            gene_name=token.split('"')[1]
    if gene_id==None:
        continue
    if gene_name==None:
        continue
    outf.write(gene_id+'\t'+gene_name+'\n')
    
