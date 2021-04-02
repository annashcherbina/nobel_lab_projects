samtools view 804-JL-2_AGGTTGGG-GTGTAGAT_S2_R1_001.trim.bam | awk '$9>0' | cut -f 9 | sort | uniq -c | sort -b -k2,2n | sed -e 's/^[ \t]*//' > fragment_length_count.txt
python get_fragment_length_distribution.py fragment_length_count.txt
