for f in diff*tsv
do
    #up
    cut -f1,2 $f | grep -v "\-1" | cut -f1|sed --expression="s/\_/\t/g" | sed --expression='1d' | bedtools sort -i stdin > $f.up.bed
    #down
    cut -f1,2 $f | grep "\-1" | cut -f1|sed --expression="s/\_/\t/g" | sed --expression='1d' | bedtools sort -i stdin > $f.down.bed
done
