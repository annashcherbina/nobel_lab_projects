#generate a task file in bed format
diff_dict=dict()
peaks=set([])
days=[0,1,3,5,7]
for day in days :
    diff_peaks=open("../limma_differential_peaks/differential_peaks_d"+str(day)+'_Y_vs_d'+str(day)+'_O.tsv','r').read().strip().split('\n')
    diff_dict[day]=dict()
    diff_dict[day]['up']=dict()
    diff_dict[day]['down']=dict()
    for line in diff_peaks[1::]:
        tokens=line.split('\t')
        peak=tokens[-1].replace('_','\t').strip('"')
        peaks.add(peak)
        print(peak)
        if float(tokens[0])>0:
            #up
            diff_dict[day]['up'][peak]=1
        else:
            diff_dict[day]['down'][peak]=1
#write output file
outf=open("age_dl_inputs.bed",'w')
outf.write('Chrom\tStart\tEnd')
for day in days:
    outf.write('\t'+str(day)+'_up'+'\t'+str(day)+'_down')
outf.write('\n')
print(str(len(peaks)))
for peak in peaks:
    outf.write(peak)
    for day in days:
        if peak in diff_dict[day]['up']:
            outf.write('\t1')
        else:
            outf.write('\t0')
        if peak in diff_dict[day]['down']:
            outf.write('\t1')
        else:
            outf.write('\t0')
    outf.write('\n')
