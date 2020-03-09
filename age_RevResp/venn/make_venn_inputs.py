young=open('diff_d3_Y_vs_d0_Y.tsv','r').read().strip().split('\n')
aged=open('diff_d3_A_vs_d0_A.tsv','r').read().strip().split('\n') 
human=open('human.diff_activated_vs_quiescent.tsv','r').read().strip().split('\n')

comparisons=set([])
diff_dict=dict()
for line in young[1::]:
    tokens=line.split('\t')
    gene=tokens[0]
    direction=float(tokens[1])
    if gene not in diff_dict:
        diff_dict[gene]=dict()
    if direction>0:
        diff_dict[gene]['up_3dy']=1
        comparisons.add('up_3dy')
    else:
        diff_dict[gene]['down_3dy']=1
        comparisons.add('down_3dy')
    diff_dict[gene]['y']=1
    comparisons.add('y')

for line in aged[1::]:
    tokens=line.split('\t')
    gene=tokens[0]
    direction=float(tokens[1])
    if gene not in diff_dict:
        diff_dict[gene]=dict()
    if direction >  0:
        diff_dict[gene]['up_3da']=1
        comparisons.add('up_3da')
    else:
        diff_dict[gene]['down_3da']=1
        comparisons.add('down_3da')
    diff_dict[gene]['a']=1
    comparisons.add('a')

for line in human[1::]:
    tokens=line.split('\t')
    gene=tokens[0]
    direction=float(tokens[1])
    if gene not in diff_dict:
        diff_dict[gene]=dict()
    if direction > 0:
        diff_dict[gene]['up_activated']=1
        comparisons.add('up_activated')
    else:
        diff_dict[gene]['down_activated']=1
        comparisons.add('down_activated')
    diff_dict[gene]['activated']=1
    comparisons.add('activated')

comparisons=list(comparisons)
outf=open('venn_input.txt','w')
outf.write('Gene'+'\t'+'\t'.join(comparisons)+'\n')
for gene in diff_dict:
    outf.write(gene)
    for comparison in comparisons:
        if comparison in diff_dict[gene]:
            outf.write('\t1')
        else:
            outf.write('\t0')
    outf.write('\n')
outf.close()

    


