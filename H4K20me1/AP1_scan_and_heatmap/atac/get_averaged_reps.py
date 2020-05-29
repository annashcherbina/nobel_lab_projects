data=open("ATAC_transformed_tpm_minus_sva_contribs.txt",'r').read().strip().split('\n')
print('loaded data')
outf=open("d0_tpm_rep_averaged.txt",'w')
outf.write("Chrom\tStart\tEnd\tD0_A\tD0_Y\n")
for line in data[1::]:
    tokens=line.split('\t')
    chrom=tokens[0].split('_')[0]
    start=tokens[0].split('_')[1]
    end=tokens[0].split('_')[2]
    mean_d0_aged=sum([float(i) for i in tokens[1:8]])/7
    mean_d0_young=sum([float(i) for i in tokens[8:12]])/4
    outf.write(chrom+'\t'+start+'\t'+end+'\t'+str(mean_d0_aged)+'\t'+str(mean_d0_young)+'\n')
outf.close()
