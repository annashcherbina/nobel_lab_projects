#for task in d0_Y_vs_d0_O d1_Y_vs_d1_O d3_Y_vs_d3_O d5_Y_vs_d5_O d7_Y_vs_d7_O d1_O_vs_d0_O d3_O_vs_d1_O d5_O_vs_d3_O d7_O_vs_d5_O d1_Y_vs_d0_Y d3_Y_vs_d1_Y d5_Y_vs_d3_Y d7_Y_vs_d5_Y
for task in d0_Y_vs_d0_O d1_Y_vs_d1_O d3_Y_vs_d3_O d5_Y_vs_d5_O d7_Y_vs_d7_O
do
    
    Rscript get_great_enrichments.R $task.down.bed $task.down
    Rscript get_great_enrichments.R $task.up.bed $task.up
    echo $task
done

