#approximates assignment of motifs to TF families
import argparse
import string
import re 
def parse_args():
    parser=argparse.ArgumentParser(description="approximates assignment of motifs to TF families")
    parser.add_argument("--homer_tf_list",default="motifs")
    parser.add_argument("--tf_lists_to_map",nargs="+")
    parser.add_argument("--out_suffix",default="tofamily")
    return parser.parse_args()

def main():
    args=parse_args()
    homer_tfs=open(args.homer_tf_list,'r').read().strip().split('\n')
    tf_map=dict()
    for line in homer_tfs:
        tf=line.split('(')[0]
        fam=line.split('(')[1].split(')')[0]
        subfam=tf.rstrip(string.digits)
        m=re.search("\d",tf)
        if m:
            subfam=tf[0:m.start()]
        tf_map[subfam]=fam
    #pdb.set_trace()
    for tf_list in args.tf_lists_to_map:
        data=open(tf_list,'r').read().strip().split('\n')
        outf=open(tf_list+"."+args.out_suffix,'w')
        outf.write("TF\tTF Family\tDNA binding domain\n")
        for tf in data:
            subfam=tf.rstrip(string.digits)
            m=re.search("\d",tf)
            if m:
                subfam=tf[0:m.start()] 
            try:
                fam=tf_map[subfam]
            except:
                fam="UNKNOWN"
            outf.write(tf+'\t'+subfam+'\t'+fam+'\n')
        

if __name__=="__main__":
    main()
    
