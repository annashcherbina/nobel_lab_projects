#annotate the foreground and background sets for GREAT with a unique identifier so that the associations of peaks to GO terms can be recovered efficiently. 
foreground=open("great_filtered_foreground.bed",'r').read().strip().split('\n') 
background=open("great_background.bed",'r').read().strip().split('\n') 
out_foreground=open("great_filtered_foreground_with_unique_id.bed",'w') 
out_background=open("great_background_with_unique_id.bed",'w') 

background_dict=dict() 
counter=0 
for peak in background: 
    out_background.write(peak+'\t'+str(counter)+'\n')
    background_dict[peak]=counter
    counter+=1 

for peak in foreground: 
    peak_index=background_dict[peak] 
    out_foreground.write(peak+'\t'+str(peak_index)+'\n') 

