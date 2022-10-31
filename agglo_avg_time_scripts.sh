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
echo Testing dataset size of 120 points 5 times:
count=0
while [ $count -le 4 ]
do
    python3 hierarchicalclustering.py time 120 avg >>avg120p_output.txt; sync
    ((count++))
done
echo successfully executed $count times, output written to avg120p_output.txt
echo Testing dataset size of 150 points 5 times:
count=0
while [ $count -le 4 ]
do
    python3 hierarchicalclustering.py time 150 avg >>avg150p_output.txt; sync
    ((count++))
done
echo successfully executed $count times, output written to avg150p_output.txt
echo Testing dataset size of 200 points 5 times. This might take a few minutes:
count=0
while [ $count -le 4 ]
do
    python3 hierarchicalclustering.py time 200 avg >>avg200p_output.txt; sync
    ((count++))
done
echo successfully executed $count times, output written to avg200p_output.txt
echo All Done!
