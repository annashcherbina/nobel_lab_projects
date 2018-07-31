for i in   d0_Y.bam  d0_Old.bam  d1_Old.bam  d1_Y.bam  d3_Old.bam  d3_Y.bam  d5_Old.bam  d5_Y.bam  d7_Old.bam  d7_Y.bam
#for i in d5_Y.bam
do
    #miso --run /data/mm10/miso/indexed.SE $i --output-dir SE/$i.out  --settings-filename=miso_settings.txt --read-len 76 
    #miso --run /data/mm10/miso/indexed.A3SS $i --output-dir A3SS/$i.out  --settings-filename=miso_settings.txt --read-len 76 
    #miso --run /data/mm10/miso/indexed.A5SS $i --output-dir A5SS/$i.out  --settings-filename=miso_settings.txt --read-len 76 &  
    #miso --run /data/mm10/miso/indexed.MXE $i --output-dir MXE/$i.out  --settings-filename=miso_settings.txt --read-len 76 
    #miso --run /data/mm10/miso/indexed.RI $i --output-dir RI/$i.out  --settings-filename=miso_settings.txt --read-len 76 
    
    #summarize_miso --summarize-samples A3SS/$i.out A3SS/$i.out
    summarize_miso --summarize-samples A5SS/$i.out A5SS/$i.out &
    summarize_miso --summarize-samples MXE/$i.out MXE/$i.out &
    summarize_miso --summarize-samples RI/$i.out RI/$i.out &
    summarize_miso --summarize-samples SE/$i.out SE/$i.out &
    
done


