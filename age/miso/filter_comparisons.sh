for f in ./d3_v_d1_Y.Comparison/d3_Y.bam.out_vs_d1_Y.bam.out/bayes-factors/d3_Y.bam.out_vs_d1_Y.bam.out.miso_bf ./d7_v_d5_Old.Comparison/d7_Old.bam.out_vs_d5_Old.bam.out/bayes-factors/d7_Old.bam.out_vs_d5_Old.bam.out.miso_bf ./d3_v_d1_Old.Comparison/d3_Old.bam.out_vs_d1_Old.bam.out/bayes-factors/d3_Old.bam.out_vs_d1_Old.bam.out.miso_bf ./d1_v_d0_Old.Comparison/d1_Old.bam.out_vs_d0_Old.bam.out/bayes-factors/d1_Old.bam.out_vs_d0_Old.bam.out.miso_bf ./d0.Comparison/d0_Old.bam.out_vs_d0_Y.bam.out/bayes-factors/d0_Old.bam.out_vs_d0_Y.bam.out.miso_bf ./d5_v_d3_Y.Comparison/d5_Y.bam.out_vs_d3_Y.bam.out/bayes-factors/d5_Y.bam.out_vs_d3_Y.bam.out.miso_bf ./d5.Comparison/d5_Old.bam.out_vs_d5_Y.bam.out/bayes-factors/d5_Old.bam.out_vs_d5_Y.bam.out.miso_bf ./d7_v_d5_Y.Comparison/d7_Y.bam.out_vs_d5_Y.bam.out/bayes-factors/d7_Y.bam.out_vs_d5_Y.bam.out.miso_bf ./d7.Comparison/d7_Old.bam.out_vs_d7_Y.bam.out/bayes-factors/d7_Old.bam.out_vs_d7_Y.bam.out.miso_bf ./d3.Comparison/d3_Old.bam.out_vs_d3_Y.bam.out/bayes-factors/d3_Old.bam.out_vs_d3_Y.bam.out.miso_bf ./d1_v_d0_Y.Comparison/d1_Y.bam.out_vs_d0_Y.bam.out/bayes-factors/d1_Y.bam.out_vs_d0_Y.bam.out.miso_bf ./d1.Comparison/d1_Old.bam.out_vs_d1_Y.bam.out/bayes-factors/d1_Old.bam.out_vs_d1_Y.bam.out.miso_bf ./d5_v_d3_Old.Comparison/d5_Old.bam.out_vs_d3_Old.bam.out/bayes-factors/d5_Old.bam.out_vs_d3_Old.bam.out.miso_bf
do
    g=`dirname $f`
    echo $g
    python filter_comparison_and_get_event_coordinates.py --bf_file $f --out_dir $g
done
	     
#filter_events --#filter /home/annashch/nobel_lab_projects/age/miso/d3_v_d1_Y.Comparison/d3_Y.bam.out_vs_d1_Y.bam.out/bayes-factors/d3_Y.bam.out_vs_d1_Y.bam.out.miso_bf --num-inc 1 --num-exc 1 --num-sum-inc-exc 10 --delta-psi 0.20 --bayes-factor 10 --output-dir d3_v_d1_Y.Comparison/#filtered/ 

#filter_events --#filter /home/annashch/nobel_lab_projects/age/miso/d7_v_d5_Old.Comparison/d7_Old.bam.out_vs_d5_Old.bam.out/bayes-factors/d7_Old.bam.out_vs_d5_Old.bam.out.miso_bf --num-inc 1 --num-exc 1 --num-sum-inc-exc 10 --delta-psi 0.20 --bayes-factor 10 --output-dir d7_v_d5_Old.Comparison/#filtered/ &

#filter_events --#filter /home/annashch/nobel_lab_projects/age/miso/d3_v_d1_Old.Comparison/d3_Old.bam.out_vs_d1_Old.bam.out/bayes-factors/d3_Old.bam.out_vs_d1_Old.bam.out.miso_bf --num-inc 1 --num-exc 1 --num-sum-inc-exc 10 --delta-psi 0.20 --bayes-factor 10 --output-dir d3_v_d1_Old.Comparison/#filtered/ &

#filter_events --#filter /home/annashch/nobel_lab_projects/age/miso/d1_v_d0_Old.Comparison/d1_Old.bam.out_vs_d0_Old.bam.out/bayes-factors/d1_Old.bam.out_vs_d0_Old.bam.out.miso_bf --num-inc 1 --num-exc 1 --num-sum-inc-exc 10 --delta-psi 0.20 --bayes-factor 10 --output-dir d1_v_d0_Old.Comparison/#filtered/ &

#filter_events --#filter /home/annashch/nobel_lab_projects/age/miso/d0.Comparison/d0_Old.bam.out_vs_d0_Y.bam.out/bayes-factors/d0_Old.bam.out_vs_d0_Y.bam.out.miso_bf --num-inc 1 --num-exc 1 --num-sum-inc-exc 10 --delta-psi 0.20 --bayes-factor 10 --output-dir d0.Comparison/#filtered/ &

#filter_events --#filter /home/annashch/nobel_lab_projects/age/miso/d5_v_d3_Y.Comparison/d5_Y.bam.out_vs_d3_Y.bam.out/bayes-factors/d5_Y.bam.out_vs_d3_Y.bam.out.miso_bf --num-inc 1 --num-exc 1 --num-sum-inc-exc 10 --delta-psi 0.20 --bayes-factor 10 --output-dir d5_v_d3_Y.Comparison/#filtered/ &

#filter_events --#filter /home/annashch/nobel_lab_projects/age/miso/d5.Comparison/d5_Old.bam.out_vs_d5_Y.bam.out/bayes-factors/d5_Old.bam.out_vs_d5_Y.bam.out.miso_bf --num-inc 1 --num-exc 1 --num-sum-inc-exc 10 --delta-psi 0.20 --bayes-factor 10 --output-dir d5.Comparison/#filtered/ &

#filter_events --#filter /home/annashch/nobel_lab_projects/age/miso/d7_v_d5_Y.Comparison/d7_Y.bam.out_vs_d5_Y.bam.out/bayes-factors/d7_Y.bam.out_vs_d5_Y.bam.out.miso_bf --num-inc 1 --num-exc 1 --num-sum-inc-exc 10 --delta-psi 0.20 --bayes-factor 10 --output-dir d7_v_d5_Y.Comparisons/#filtered/ &

#filter_events --#filter /home/annashch/nobel_lab_projects/age/miso/d7.Comparison/d7_Old.bam.out_vs_d7_Y.bam.out/bayes-factors/d7_Old.bam.out_vs_d7_Y.bam.out.miso_bf --num-inc 1 --num-exc 1 --num-sum-inc-exc 10 --delta-psi 0.20 --bayes-factor 10 --output-dir d7.Comparison/#filtered/ &

#filter_events --#filter /home/annashch/nobel_lab_projects/age/miso/d3.Comparison/d3_Old.bam.out_vs_d3_Y.bam.out/bayes-factors/d3_Old.bam.out_vs_d3_Y.bam.out.miso_bf --num-inc 1 --num-exc 1 --num-sum-inc-exc 10 --delta-psi 0.20 --bayes-factor 10 --output-dir d3.Comparison/#filtered/ &

#filter_events --#filter /home/annashch/nobel_lab_projects/age/miso/d1_v_d0_Y.Comparison/d1_Y.bam.out_vs_d0_Y.bam.out/bayes-factors/d1_Y.bam.out_vs_d0_Y.bam.out.miso_bf --num-inc 1 --num-exc 1 --num-sum-inc-exc 10 --delta-psi 0.20 --bayes-factor 10 --output-dir d1_v_d0_Y.Comparison/#filtered/ &

#filter_events --#filter /home/annashch/nobel_lab_projects/age/miso/d1.Comparison/d1_Old.bam.out_vs_d1_Y.bam.out/bayes-factors/d1_Old.bam.out_vs_d1_Y.bam.out.miso_bf --num-inc 1 --num-exc 1 --num-sum-inc-exc 10 --delta-psi 0.20 --bayes-factor 10 --output-dir d1.Comparison/#filtered/ &

#filter_events --#filter /home/annashch/nobel_lab_projects/age/miso/d5_v_d3_Old.Comparison/d5_Old.bam.out_vs_d3_Old.bam.out/bayes-factors/d5_Old.bam.out_vs_d3_Old.bam.out.miso_bf --num-inc 1 --num-exc 1 --num-sum-inc-exc 10 --delta-psi 0.20 --bayes-factor 10 --output-dir d5_v_d3_Old.Comparison/#filtered/ &


