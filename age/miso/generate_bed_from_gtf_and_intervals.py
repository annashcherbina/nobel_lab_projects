gtf=open("/data/mm10/Mus_musculus.GRCm38.87.gtf",'r').read().strip().split('\n')
import sys
intervals=open(sys.argv[1],'r').read().strip().split('\n')
gtf_bed=open("Mus_musculus.GRCm38.bed",'w')
for line in gtf: 
    tokens=line.split('\t') 
    if (len(tokens)<9):
        print(str(tokens))
        continue 
    chrom=tokens[0] 
    startpos=tokens[3] 
    endpos=tokens[4] 
    gene_name_list=tokens[8].split(';') 
    gene_name=None 
    for entry in gene_name_list: 
        if entry.__contains__("gene_name"): 
            gene_name=entry.split('"')[1] 
            break 
    gtf_bed.write(chrom+'\t'+startpos+'\t'+endpos+'\t'+str(gene_name)+'\n')
print("generated bed file of gtf") 
outf=open(sys.argv[1].split('/')[-1]+".bed",'w')
for line in intervals[1::]: 
    tokens=line.split('\t') 
    event=tokens[0]
    pos=event.split(":")[0:3] 
    outf.write('\t'.join(pos)+'\t'+event+'\n')
