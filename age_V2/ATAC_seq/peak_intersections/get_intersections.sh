for age_dataset in `cat overlap_peaks.txt`
do
    age_dataset_basename=`basename $age_dataset`
    #echo $age_dataset_basename
    n_age_reads=` zcat $age_dataset| wc -l`
    #echo $n_age_reads
    for external_dataset in `cat external_datasets.txt`
    do
	external_dataset_basename=`basename $external_dataset`
	#echo $external_dataset_basename 
	n_external_reads=`cat $external_dataset | wc -l`
	n_age_intersection=`bedtools intersect -u -a $age_dataset -b $external_dataset | sort | uniq | wc -l`
	n_external_intersection=`bedtools intersect -u -b $age_dataset -a $external_dataset | sort | uniq | wc -l`
	echo "$age_dataset_basename $n_age_reads $external_dataset_basename $n_external_reads $n_age_intersection $n_external_intersection"
    done
done
