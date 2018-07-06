import sys 
data=open(sys.argv[1],'r').read().strip().split('\n') 
outf=open(sys.argv[1]+'.mapping','w') 
event_dict=dict() 
for line in data: 
    tokens=line.split('\t') 
    event=tokens[0] 
    genename=tokens[1] 
    if event not in event_dict: 
        event_dict[event]=[genename] 
    else: 
        event_dict[event].append(genename) 
for event in event_dict: 
    outf.write(event+'\t'+';'.join(event_dict[event])+'\n')
