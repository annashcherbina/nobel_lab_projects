import argparse
from scipy.stats.stats import pearsonr
from scipy.stats.stats import spearmanr
def parse_args():
    parser=argparse.ArgumentParser()
    parser.add_argument("--summary_file",default="summary.young.old.tf.median.vals.known.txt")
    parser.add_argument("--label_old")
    parser.add_argument("--label_young")
    parser.add_argument("--index_young",type=int)
    parser.add_argument("--index_old",type=int)
    parser.add_argument("--index_class",type=int)
    parser.add_argument("--outf")
    parser.add_argument("--corrtype")
    return parser.parse_args()

def main():
    args=parse_args()
    data=open(args.summary_file,'r').read().strip().split('\n')
    class_dict=dict()
    for line in data[1::]:
        tokens=line.split('\t')
        cur_class=tokens[args.index_class]
        cur_young=tokens[args.index_young]
        cur_old=tokens[args.index_old]
        if ((cur_young=="NA") or (cur_old=="NA")):
            continue 
        if cur_class not in class_dict:
            class_dict[cur_class]=dict() 
            class_dict[cur_class][args.label_old]=[float(cur_old)]
            class_dict[cur_class][args.label_young]=[float(cur_young)]
        else:
            class_dict[cur_class][args.label_old].append(float(cur_old))
            class_dict[cur_class][args.label_young].append(float(cur_young))
    print("parsed data")
    print("computing correlations")
    classes=list(class_dict.keys())
    outf=open(args.outf,'w')
    outf.write('\t'+'\t'.join(classes)+'\n')
    for young_class in classes:
        outf.write(young_class)
        for old_class in classes:
            #compute correlation
            young_vals=class_dict[young_class][args.label_young]
            old_vals=class_dict[old_class][args.label_old]
            young_vals=sum(young_vals)/len(young_vals)
            old_vals=sum(old_vals)/len(old_vals)
            if old_vals==0:
                fc=young_vals
            else:
                fc=young_vals/old_vals
            '''
            if args.corrtype=="pearson":
                cur_corr=pearsonr(young_vals,old_vals)
            elif args.corrtype=="spearman":
                print(young_vals)
                print(old_vals)
                cur_corr=pearsonr(young_vals,old_vals)
            else:
                raise Exception("incorrect correlation type specified")
            outf.write('\t'+str(cur_corr))
            '''
            outf.write('\t'+str(fc))
        outf.write('\n')
        
            
if __name__=="__main__":
    main()
    
