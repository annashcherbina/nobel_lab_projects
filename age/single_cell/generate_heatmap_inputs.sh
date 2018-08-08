metric="med"
python generate_heatmap_inputs.py --label_old "d0_$metric_O" \
       --label_young "d0_$metric_Y" \
       --index_young 9 \
       --index_old 18 \
       --index_class 2 \
       --outf d0.$metric.hmap.inputs \
       --corrtype spearman


python generate_heatmap_inputs.py --label_old "d3_$metric_O" \
       --label_young "d3_$metric_Y" \
       --index_young 10 \
       --index_old 19 \
       --index_class 2 \
       --outf d3.$metric.hmap.inputs \
       --corrtype spearman


python generate_heatmap_inputs.py --label_old "d7_$metric_O" \
       --label_young "d7_$metric_Y" \
       --index_young 11 \
       --index_old 20 \
       --index_class 2 \
       --outf d7.$metric.hmap.inputs \
       --corrtype spearman
