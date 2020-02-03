#find differential peaks that are near differential genes. 
peak_list=open("hglft_genome_7d4b_9823a0.bed",'r').read().strip().split('\n') 
gtf_file=open("Mus_musculus.GRCm38.87.gtf",'r') 
diff_genes_dir="wt_vs_ko_sat" 
from os import listdir
from os.path import isfile, join
diff_gene_files = [f for f in listdir(diff_genes_dir) if isfile(join(diff_genes_dir, f))]
print("forming gtf dictionary")
gtf_dict=dict()
import pdb 
for line in gtf_file: 
    if line.startswith("#"):
        continue 
    tokens=line.split('\t') 
    chrom='chr'+tokens[0] 
    start_pos=int(tokens[3])
    end_pos=int(tokens[4])
    gene_id=tokens[8].split('"')[1]
    #print(str(gene_id))
    if gene_id not in gtf_dict: 
        gtf_dict[gene_id]=[chrom,start_pos,end_pos]
    else: 
        if start_pos  < gtf_dict[gene_id][1]: 
            gtf_dict[gene_id][1]=start_pos 
        if end_pos > (gtf_dict[gene_id][2]): 
            gtf_dict[gene_id][2]=end_pos 
print("finished gtf dictionary!") 
#pdb.set_trace() 
diff_gene_dict=dict() 
#generate bins of 100k 
for f in diff_gene_files: 
    data=open(diff_genes_dir+'/'+f,'r').read().strip().split('\n') 
    for line in data: 
        tokens=line.split('\t') 
        gene_name=tokens[-1].split('_')[0] 
        gene_name=gene_name.replace('"','') 
        #print(":"+str(gene_name)+":")
        try:
            gene_coords=gtf_dict[gene_name] 
        except: 
            #pdb.set_trace() 
            continue 
        chrom=gene_coords[0] 
        startpos=gene_coords[1] 
        endpos=gene_coords[2]
        cur_bin=startpos/100000 
        entry=tuple([startpos,endpos])
        if chrom not in diff_gene_dict: 
            diff_gene_dict[chrom]=dict() 
        if cur_bin not in diff_gene_dict[chrom]: 
            diff_gene_dict[chrom][cur_bin]=dict() 
            lfc=tokens[0]
        diff_gene_dict[chrom][cur_bin][entry]=[tokens[-1].replace('"',''),lfc]
print("generated dictionary of differential gene positions") 
outf=open("peak_to_gene_map.txt",'w') 
for peak in peak_list: 
    tokens=peak.split('\t') 
    chrom=tokens[0] 
    peak_lfc=tokens[-1].split('_')[1] 
    peak='\t'.join(tokens[0:3])+'\t'+peak_lfc 
    startpos=int(tokens[1]) 
    if chrom in diff_gene_dict: 
        cur_bin=int(startpos/100000)
        for bin in range(cur_bin -1, cur_bin+2): 
            if bin in diff_gene_dict[chrom]: 
                for entry in diff_gene_dict[chrom][bin]: 
                    hashed_startpos=entry[0] 
                    if abs(hashed_startpos-startpos)<10000: 
                        #keep the peak! 
                        gene_name=diff_gene_dict[chrom][bin][entry][0] 
                        cur_lfc=diff_gene_dict[chrom][bin][entry][1]
                        outf.write(peak+'\t'+gene_name+'\t'+cur_lfc+'\t'+chrom+'\t'+'\t'.join([str(i) for i in entry])+'\n')
                        break 
                    

            

