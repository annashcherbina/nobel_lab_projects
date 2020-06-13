peaks=/mnt/lab_data2/annashch/nobel_lab_projects/age_V2/ATAC_seq/footprints/myod/intersection.neg.pos.aggregate.bed
tfbs=/mnt/lab_data2/annashch/nobel_lab_projects/age_V2/ATAC_seq/footprints/myod/myod.scan.out.bed
for day in 0 1 3 5 7
do
    TOBIAS PlotAggregate --TFBS $tfbs --regions $peaks --signals d$day\_Aged_corrected.bw d$day\_Young_corrected.bw --output d$day\_Myod.pdf --share_y both --plot_boundaries --title "Day $day"  --flank 100 --remove-outliers 1 --log-transform
done

