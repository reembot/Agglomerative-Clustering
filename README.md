# Agglomerative-Clustering

### This algorithm is designed to utilize the Agglomerative clustering method for grouping sets of data points.

Three testing scripts have been provided which will output their results to text files in your working directory:
1. **agglo_func_tests_scripts.sh** will test the algorithm functionality with various data sets of different attributes and uses Single, Complete, and Average Linkage
2. **agglo_avg_time_scripts.sh** will test performance timing with various data set sizes using Average Linkage
3. **agglo_sin_time_scripts.sh** will test performance timing with various data set sizes using Single Linkage (this will result in the same runtime as Complete Linkage)

To run test scripts, run:

`sh <scriptname>`


To run your own datasets, you can specify options on the command line:
- **arg1:** 'test' will require an input filepath of .csv format to be specified in arg2
  
  OR
- **arg1:** 'time' will generate a randomized set of datapoints of the size of your choosing to be specified in arg2

- **arg2:** `filepath` of your .csv file if 'test' was entered for arg1

  OR
- **arg2:** `size` of randomized dataset you wish to test if 'time' was entered for arg1

- **arg3:** 'sin' will execute the algorithm using Single Linkage

  OR
- **arg3:** 'com' will execute the algorithm using Complete Linkage

  OR
- **arg3:** 'avg' will execute the algorithm using Average Linkage
