data=open('boxplot_input.txt','r').read().strip().split('\n')
outf=open('boxplot_input.formatted.txt','w')
outf.write('Gene\tTPM\tAge\n')
header=data[0].split('\t')
for line in data[1::]:
    tokens=line.split('\t')
    gene_name=tokens[1]
    for i in range(2,len(tokens)):
        if header[i].startswith('d0_Old'):
            #This is a replicate for 'Old'
            outf.write(gene_name+'\t'+tokens[i]+'\t'+'Old'+'\n')
        elif header[i].startswith('d0_Y'):
            #This is a replicate for 'Young' 
            outf.write(gene_name+'\t'+tokens[i]+'\t'+'Young'+'\n')
            
