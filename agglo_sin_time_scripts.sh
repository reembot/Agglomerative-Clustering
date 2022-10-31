#!/bin/bash

echo Starting Run Time Tests for Single Linkage...
echo Testing dataset size of 10 points 5 times:
count=0
while [ $count -le 4 ]
do
    python3 hierarchicalclustering.py time 10 sin >>sin10p_output.txt; sync
    ((count++))
done
echo Successfully executed $count times, output written to sin10p_output.txt
echo Testing dataset size of 50 points 5 times:
count=0
while [ $count -le 4 ]
do
    python3 hierarchicalclustering.py time 50 sin >>sin50p_output.txt; sync
    ((count++))
done
echo successfully executed $count times, output written to sin50p_output.txt
echo Testing dataset size of 100 points 5 times:
count=0
while [ $count -le 4 ]
do
    python3 hierarchicalclustering.py time 100 sin >>sin100p_output.txt; sync
    ((count++))
done
echo successfully executed $count times, output written to sin100p_output.txt
echo Testing dataset size of 120 points 5 times:
count=0
while [ $count -le 4 ]
do
    python3 hierarchicalclustering.py time 120 sin >>120p_output.txt; sync
    ((count++))
done
echo successfully executed $count times, output written to sin120p_output.txt
echo Testing dataset size of 150 points 5 times:
count=0
while [ $count -le 4 ]
do
    python3 hierarchicalclustering.py time 150 sin >>150p_output.txt; sync
    ((count++))
done
echo successfully executed $count times, output written to sin150p_output.txt
echo Testing dataset size of 200 points 5 times. This might take a few minutes:
count=0
while [ $count -le 4 ]
do
    python3 hierarchicalclustering.py time 200 sin >>200p_output.txt; sync
    ((count++))
done
echo successfully executed $count times, output written to sin200p_output.txt
echo All Done!
