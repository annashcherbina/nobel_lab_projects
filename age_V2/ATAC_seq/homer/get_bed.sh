#get bed files for homer
for day in 0 1 3 5 7
do
    cut -f1,2 ../diff_peaks/diff_d$day\_Y_vs_A.tsv | grep -v "\-"   | cut -f1 | sed --expression='s/\_/\t/g' > day$day\_up_in_young.bed
    cut -f1,2 ../diff_peaks/diff_d$day\_Y_vs_A.tsv | grep  "\-"   | cut -f1 | sed --expression='s/\_/\t/g' > day$day\_up_in_aged.bed 
done
