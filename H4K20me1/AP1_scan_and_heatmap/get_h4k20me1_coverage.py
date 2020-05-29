import pyBigWig
aged_bw=pyBigWig.open('5p.counts.Old.bw','r')
young_bw=pyBigWig.open('5p.counts.Young.bw','r')
young_peaks=open('ap1.unique.Young.nearest.tss.bed','r').read().strip().split('\n')
aged_peaks=open('ap1.unique.Aged.nearest.tss.bed','r').read().strip().split('\n')
outf=open('young.H4K20me1.coveraged.txt','w')
outf.write('Chrom\tYoung\tAged\tAgedCoverage\tYoungCoverage\n')
for line in young_peaks:
    tokens=line.split('\t')
    chrom=tokens[0]
    start=tokens[1]
    end=tokens[2]
    young_sum=sum(young_bw.values(chrom,int(start),int(end)))
    aged_sum=sum(aged_bw.values(chrom,int(start),int(end)))
    outf.write(chrom+'\t'+start+'\t'+end+'\t'+str(aged_sum)+'\t'+str(young_sum)+'\n')
outf.close()
outf=open('aged.H4K20me1.coveraged.txt','w')
outf.write('Chrom\tStart\tEnd\tAgedCoverage\tYoungCoverage\n')
for line in aged_peaks:
    tokens=line.split('\t')
    chrom=tokens[0]
    start=tokens[1]
    end=tokens[2]
    young_sum=sum(young_bw.values(chrom,int(start),int(end)))
    aged_sum=sum(aged_bw.values(chrom,int(start),int(end)))
    outf.write(chrom+'\t'+start+'\t'+end+'\t'+str(aged_sum)+'\t'+str(young_sum)+'\n')
outf.close()
