#!/bin/bash

echo Starting Functionality Tests...
echo Testing dataset test_1 with Single Linkage for data points close together:
echo Remember to close dendrogram window for program to continue...
    python3 hierarchicalclustering.py test test_1.csv sin >sintest1_output.txt; sync
done
echo Testing dataset test_1 with Average Linkage for data points close together:
echo Remember to close dendrogram window for program to continue...
    python3 hierarchicalclustering.py test test_1.csv avg >avgtest1_output.txt; sync
done
echo Testing dataset test_1 with Complete Linkage for data points close together:
echo Remember to close dendrogram window for program to continue...
    python3 hierarchicalclustering.py test test_1.csv com >comtest1_output.txt; sync
done
echo Testing dataset test_2 with Single Linkage for data points far apart:
echo Remember to close dendrogram window for program to continue...
    python3 hierarchicalclustering.py test test_2.csv sin >test2_output.txt; sync
done
echo Testing dataset test_3 with Single Linkage for a single data point:
echo Remember to close dendrogram window for program to continue...
    python3 hierarchicalclustering.py test test_3.csv sin >test3_output.txt; sync
done
echo Testing dataset test_4 with Single Linkage for an empty data set:
echo Remember to close dendrogram window for program to continue...
    python3 hierarchicalclustering.py test test_4.csv sin >test4_output.txt; sync
done
echo Testing dataset test_5 with Single Linkage for a large dataset of 100 points:
echo Remember to close dendrogram window for program to continue...
    python3 hierarchicalclustering.py test test_4.csv sin >test5_output.txt; sync
done
echo Testing dataset test_6 with Single Linkage for set of 10 duplicate data points:
echo Remember to close dendrogram window for program to continue...
    python3 hierarchicalclustering.py test test_6.csv sin >test6_output.txt; sync
done

echo All Done!
