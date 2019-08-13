for day in 0 1 3 5 7
do
    cut -f1,2 /mnt/lab_data2/annashch/nobel_lab_projects/age_V2/RNA_seq/diff_genes/diff_d$day\_Y_vs_A.tsv | grep -v "\-1" | cut -f1| cut -f2 -d "_" | sed '1d' > diff_$day.up_in_young.txt
    cut -f1,2 /mnt/lab_data2/annashch/nobel_lab_projects/age_V2/RNA_seq/diff_genes/diff_d$day\_Y_vs_A.tsv | grep  "\-1" | cut -f1| cut -f2 -d "_" | sed '1d' > diff_$day.up_in_aged.txt
    
done
