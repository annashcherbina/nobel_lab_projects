#get fold change of young/old
#average across replicates

cpm=open("filtered_cpm_peaks.txt",'r').read().strip().split('\n')
diff_peaks=open("all.diff.bed",'r').read().strip().split("\n")
outf=open("dpgp_peak_Y_vs_O_inputs.txt",'w')
outf.write('Chrom_Start_Pos\td0\td1\td3\td5\td7\n')
outf2=open('kmeans_peak_inputs.txt','w')
outf2.write('Chrom_Start_Pos\td0_Old\td1_Old\td3_Old\td5_Old\td7_Old\td0_Y\td1_Y\td3_Y\td5_Y\td7_Y\n')
diff_dict=dict()
for line in diff_peaks:
    diff_dict[line]=1
for line in cpm[1::]:
    tokens=line.split('\t')
    peak=tokens[0]
    if peak in diff_dict:
        #this is a differential peak
        tokens=[float(i) for i in tokens[1::]]
        d0_O=sum([tokens[i] for i in [0,1,2,3]])/4
        d0_Y=sum([tokens[i] for i in [4,5]])/2
        if d0_O==0:
            d0_fold=d0_Y
        else:
            d0_fold=d0_Y/d0_O
        
        d1_O=sum([tokens[i] for i in [6,7]])/2
        d1_Y=sum([tokens[i] for i in [8,9,10]])/3
        if d1_O==0:
            d1_fold=d0_Y
        else:
            d1_fold=d0_Y/d0_O
        
        d3_O=sum([tokens[i] for i in [11,12,13,14]])/4
        d3_Y=sum([tokens[i] for i in [15,16,17,18]])/4
        if d3_O==0:
            d3_fold=d3_Y
        else:
            d3_fold=d3_Y/d3_O
        
        d5_O=sum([tokens[i] for i in [19,20,21,22]])/4
        d5_Y=sum([tokens[i] for i in [23,24]])/2
        if d5_O==0:
            d5_fold=d5_Y
        else:
            d5_fold=d5_Y/d5_O
        
        d7_O=sum([tokens[i] for i in [25,26]])/2
        d7_Y=sum([tokens[i] for i in [27,28]])/2
        if d7_O==0:
            d7_fold=d7_Y
        else:
            d7_fold=d7_Y/d7_O
        outf.write(peak+'\t'+str(d0_fold)+'\t'+str(d1_fold)+'\t'+str(d3_fold)+'\t'+str(d5_fold)+'\t'+str(d7_fold)+'\n') 
        outf2.write(peak+'\t'+str(d0_O)+'\t'+str(d1_O)+'\t'+str(d3_O)+'\t'+str(d5_O)+'\t'+str(d7_O)+'\t'+str(d0_Y)+'\t'+str(d1_Y)+'\t'+str(d3_Y)+'\t'+str(d5_Y)+'\t'+str(d7_Y)+'\n')

