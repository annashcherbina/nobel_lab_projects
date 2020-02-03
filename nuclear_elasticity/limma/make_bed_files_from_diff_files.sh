for i in hESC_HiFTCtrl hESC_LaminAKD hESC_Syne1Sun2KD HiFTCtrl_LaminAKD HiFTCtrl_Syne1Sun2KD LaminAKD_Syne1Sun2KD
do
    
    sed '1d' diff_$i.tsv | cut -f1 | sed --expression="s/\_/\t/g" | bedtools sort -i > diff_$i.bed
done
