#for sample in d0.Aged d0.Young.PAX7 d0.Young d1.Aged d1.Young d3.Aged d3.Young d5.Aged d5.Young d7.Aged d7.Young SOD1
for sample in d0.Aged d0.Young.PAX7 d0.Young d1.Aged d1.Young d3.Aged d5.Aged d5.Young d7.Aged d7.Young SOD1
do
    sbatch --ntasks-per-node 12 --cpus-per-task 5 -J $sample -o logs/$sample.o -e logs/$sample.e generate_bigwigs.$sample.sh
    echo $sample
done
