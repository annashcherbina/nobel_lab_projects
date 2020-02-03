#this script generates the background file to be used for GREAT
cat ../sample_4_nemo.overlap.bed ../sample_5_nemo.overlap.bed ../sample_9_control.overlap.bed | bedtools sort | bedtools merge > great_background.bed

#GREAT requires each region of the foreground to be reproduced exactly in the background.
#Hence we use the bedtools closest command
bedtools closest -a great_foreground.bed -b great_background.bed | cut -f4,5,6 | uniq > great_filtered_foreground.bed
