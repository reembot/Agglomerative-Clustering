#!/bin/bash

echo Starting Run Time Tests for Average Linkage...
echo Testing dataset size of 10 points 5 times:
count=0
while [ $count -le 4 ]
do
    python3 hierarchicalclustering.py time 10 avg >>avg10p_output.txt; sync
    ((count++))
done
echo Successfully executed $count times, output written to avg10p_output.txt
echo Testing dataset size of 50 points 5 times:
count=0
while [ $count -le 4 ]
do
    python3 hierarchicalclustering.py time 50 avg >>avg50p_output.txt; sync
    ((count++))
done
echo successfully executed $count times, output written to avg50p_output.txt
echo Testing dataset size of 100 points 5 times:
count=0
while [ $count -le 4 ]
do
    python3 hierarchicalclustering.py time 100 avg >>avg100p_output.txt; sync
    ((count++))
done
echo successfully executed $count times, output written to avg100p_output.txt
echo Testing dataset size of 500 points 5 times:
count=0
while [ $count -le 4 ]
do
    python3 hierarchicalclustering.py time 500 avg >>avg500p_output.txt; sync
    ((count++))
done
echo successfully executed $count times, output written to avg500p_output.txt
echo All Done!
