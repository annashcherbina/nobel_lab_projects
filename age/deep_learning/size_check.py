data=open('age.train.bed','r').read().strip().split('\n')
for line in data[1::]:
    tokens=line.split('\t')
    start=int(tokens[1])
    end=int(tokens[2])
    print(end-start)
    
