import numpy as np
import pandas as pd
import sys
data=pd.read_table(sys.argv[1],header=None,sep=' ')
data=data[data[1]<1000]
data=data[data[1]>50]
mids = 0.5*(data[1][1:] + data[1][:-1])
probs = data[0] / np.sum(data[0])

mean = np.sum(probs * mids)
sd = np.sqrt(np.sum(probs * (mids - mean)**2))
print(str(mean))
print(str(sd))

