#create a dataframe of percent of peaks in each chromatin state for the set of comparisons performed 
comparisons=["control_annotations_heart.bed","control_annotations_limb.bed","differential_annotations_heart.bed","differential_annotations_limb.bed","nemo_annotations_heart.bed","nemo_annotations_limb.bed"]
outf=open('chromhmm.annotated.df.txt','w') 

#state -> sample -> percent 
state_dict=dict() 
for comparison in comparisons: 
    data=open(comparison,'r').read().strip().split('\n') 
    peaks_by_state=dict() 
    total_peaks=len(data) 
    for line in data: 
        tokens=line.split('\t') 
        state=tokens[-1] 
        if state not in peaks_by_state: 
            peaks_by_state[state]=1
        else: 
            peaks_by_state[state]+=1 
    #get fraction of peaks in each state 
    for state in peaks_by_state: 
        if state not in state_dict: 
            state_dict[state]=dict() 
        state_dict[state][comparison]=float(peaks_by_state[state])/total_peaks 

#write the output file 
outf.write('State\t'+'\t'.join(comparisons)+'\n')
for state in state_dict: 
    outf.write(state) 
    for comparison in comparisons: 
        if comparison in state_dict[state]: 
            outf.write('\t'+str(state_dict[state][comparison]))
        else: 
            outf.write('\t0')
    outf.write('\n')
