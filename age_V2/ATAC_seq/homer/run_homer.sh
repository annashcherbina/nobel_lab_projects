module load homer
for day in 0 1 3 5 7
do
    findMotifsGenome.pl day$day\_up_in_young.bed mm10 homer.day$day\_up_in_young -bg background.bed -p 30 
    findMotifsGenome.pl day$day\_up_in_aged.bed mm10 homer.day$day\_up_in_aged -bg background.bed  -p 30
done
