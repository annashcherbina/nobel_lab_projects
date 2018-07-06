#for i in   d0_Y.bam  d0_Old.bam  d1_Old.bam  d1_Y.bam  d3_Old.bam  d3_Y.bam  d5_Old.bam  d5_Y.bam  d7_Old.bam  d7_Y.bam
for i in d5_Y.bam
do
    miso --run /data/mm10/miso/indexed.SE $i --output-dir $i.out  --settings-filename=miso_settings.txt --read-len 76
    summarize_miso --summarize-samples $i.out $i.out 
done


