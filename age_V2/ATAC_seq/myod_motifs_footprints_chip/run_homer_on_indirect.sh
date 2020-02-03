#run  homer on "indirect" peaks
module load homer
for sample in d0_A.optimal_peak.narrowPeak.gz.indirect d1_Y.optimal_peak.narrowPeak.gz.indirect d5_Y.optimal_peak.narrowPeak.gz.indirect d0_Y.optimal_peak.narrowPeak.gz.indirect d3_A.optimal_peak.narrowPeak.gz.indirect d7_A.optimal_peak.narrowPeak.gz.indirect d0_Y_Pax7.optimal_peak.narrowPeak.gz.indirect d3_Y.optimal_peak.narrowPeak.gz.indirect d7_Y.optimal_peak.narrowPeak.gz.indirect d1_A.optimal_peak.narrowPeak.gz.indirect d5_A.optimal_peak.narrowPeak.gz.indirect
do
    findMotifsGenome.pl $sample mm10 homer.$sample -bg myo.MYOD1.bed  -p 10 &
done
