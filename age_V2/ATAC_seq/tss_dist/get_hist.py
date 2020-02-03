import argparse
import pandas as pd
from math import floor 
import pdb

def parse_args():
    parser=argparse.ArgumentParser(description="histogram of read dist")
    parser.add_argument("--inputf",nargs="+")
    parser.add_argument("--outf",nargs="+")
    return parser.parse_args()

def main():
    args=parse_args()
    for i in range(len(args.inputf)):
        print(args.inputf[i])
        data=pd.read_csv(args.inputf[i],header=None,sep='\t')

        outf=open(args.outf[i],'w')
        dist_hist=dict()
        for index,row in data.iterrows():
            dist=row[16]/1000
            if abs(dist)<5:
                if dist < 0:
                    if -5 not in dist_hist:
                        dist_hist[-5]=1
                    else:
                        dist_hist[-5]+=1
                else:
                    if 5 not in dist_hist:
                        dist_hist[5]=1
                    else:
                        dist_hist[5]+=1
            elif abs(dist)<10:
                if dist < 0:
                    if -10 not in dist_hist:
                        dist_hist[-10]=1
                    else:
                        dist_hist[-10]+=1
                else:
                    if 10 not in dist_hist:
                        dist_hist[10]=1
                    else:
                        dist_hist[10]+=1
            elif abs(dist)<50:
                if dist < 0:
                    if -50 not in dist_hist:
                        dist_hist[-50]=1
                    else:
                        dist_hist[-50]+=1
                else:
                    if 50 not in dist_hist:
                        dist_hist[50]=1
                    else:
                        dist_hist[50]+=1            
            elif abs(dist)<100:
                if dist < 0:
                    if -100 not in dist_hist:
                        dist_hist[-100]=1
                    else:
                        dist_hist[-100]+=1
                else:
                    if 100 not in dist_hist:
                        dist_hist[100]=1
                    else:
                        dist_hist[100]+=1                        
            elif abs(dist)<500:
                if dist < 0:
                    if -500 not in dist_hist:
                        dist_hist[-500]=1
                    else:
                        dist_hist[-500]+=1
                else:
                    if 500 not in dist_hist:
                        dist_hist[500]=1
                    else:
                        dist_hist[500]+=1
            else:
                if dist < 0:
                    if -1000 not in dist_hist:
                        dist_hist[-1000]=1
                    else:
                        dist_hist[-1000]+=1
                else:
                    if 1000 not in dist_hist:
                        dist_hist[1000]=1
                    else:
                        dist_hist[1000]+=1
                
                
        for key in dist_hist:
            outf.write(str(key)+'\t'+str(dist_hist[key])+'\n')
    
if __name__=="__main__":
    main()
    
