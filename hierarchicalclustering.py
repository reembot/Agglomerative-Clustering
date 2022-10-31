from sklearn.preprocessing import normalize
from sklearn.datasets import make_blobs
import numpy as np
import matplotlib.pyplot as plt
from scipy.cluster.hierarchy import linkage, dendrogram
import time
import math
import sys
import csv

# take in CLI args for: test type, dataset size/csv filepath, and single/complete/avg linkage
dataset = []

if len(sys.argv) > 2:

  if sys.argv[1] == 'test':
    with open(sys.argv[2]) as file:
        data = csv.reader(file, delimiter = ',')
        for rows in data:
          dataset.append((rows[0], rows[1]))

  elif sys.argv[1] == 'time':
    dataset = make_blobs(n_samples = int(sys.argv[2]), n_features = 2, centers = 10, cluster_std = 1, random_state = 10)
    dataset = dataset[0]
  else:
    print('Please specify test type as described in README.md')
    exit(1)
    
else:
    print('Please specify options as described in README.md')
    exit(1)

#################################################################################
###################### HELPER FUNCTION DEFINTIONS ###############################
#################################################################################

# merge two clusters
def merge(clusterID1, clusterID2):

  cluster2 = clusters[clusterID2]
  clusters[clusterID1].extend(cluster2)
  
  del clusters[clusterID2]

# finds the euclidian distance between two points
def distance_2points(point1, point2):
  final_dist = 0.0
 
  for i in range(len(point1)):
    a1 = np.round(point1[i], decimals=3) 
    a2 = np.round(point2[i], decimals=3)
    distance = a1-a2

    final_dist += pow(distance, 2)

  final_dist = math.sqrt(final_dist)
  return np.round(final_dist, decimals=3)


# find closest point distance between two clusters:
def calc_single_linkage(clusterID1, clusterID2):

  cluster1 = clusters[clusterID1]
  cluster2 = clusters[clusterID2]
  min_dist = np.Inf
  
  for coord1 in cluster1:
    for coord2 in cluster2:

      dist = distance_2points(coord1, coord2)
      if dist < min_dist:
        min_dist = dist

  # print('   Minimum Distance', min_dist, 'between Clusters', clusterID1, '&', clusterID2)
  return np.round(min_dist, decimals= 3)



# find farthest point distance between two clusters:
def calc_complete_linkage(clusterID1, clusterID2):

  cluster1 = clusters[clusterID1]
  cluster2 = clusters[clusterID2]
  max_dist = 0

  for coord1 in cluster1:
    for coord2 in cluster2:

      dist = distance_2points(coord1, coord2)
      if dist > max_dist:
        max_dist = dist
        
  # print('  Maximum Distance', max_dist, 'between Clusters', clusterID1, '&', clusterID2)
  return np.round(max_dist, decimals= 3)


# find average point distance between two clusters:
def calc_average_linkage(clusterID1, clusterID2):

  cluster1 = clusters[clusterID1]
  cluster2 = clusters[clusterID2]
  all_distances = []

  for coord1 in cluster1:
    for coord2 in cluster2:
      
      all_distances.append(distance_2points(coord1, coord2))
  
  # print('  Average Distance', np.round(np.mean(all_distances), decimals= 3), 'between Clusters', clusterID1, '&', clusterID2)
  return np.round(np.mean(all_distances), decimals= 3)

#################################################################################
############################# MAIN FUNCTION #####################################
#################################################################################

if len(dataset) < 2:
  print('Dataset is too small')
  exit(1)

method = ''
if sys.argv[3] == 'sin':
  method = 'single'
elif sys.argv[3] == 'com':
  method = 'complete'
elif sys.argv[3] == 'avg':
  method = 'average'
else:
  print('Bad input provided. Aborting.')
  exit(1)

# plot dendrogram for testing
if sys.argv[1] == 'test':
  matrix = linkage(dataset, method= method)
  plt.figure(figsize= (10, 10))
  plt.title('Hierarchical Clustering Dendrogram (Agglomerative)')
  plt.xlabel('Cluster ID')
  plt.ylabel('Euclidian Distance')
  dendrogram(matrix)
  plt.show()


# for output metrics
numPoints = len(dataset)

# converts dataset into list of tuple coordinates
coords = list(dataset)
for i in range(len(coords)):
  coords[i] = tuple(coords[i])

  # take starting timestamp
start = time.time()
# (clusterID1, [setOfPoints]), (clusterID2, [setofPoints])
clusters= {}

# create cluster for each point/coord
for clusterID, point in enumerate(coords):
  clusters[clusterID] = [point]

if method == 'test':
  print("Beginning Clusters for", numPoints, "Data Points:\n", clusters)

farthest_dist = 0
farthest_clusts = (-1, -1)

while len(clusters) > 1:

  min_dist = np.Inf
  closest_pair = (-1,-1)

  # iterate through all clusters and calculate distance between them
  for i in range(len(clusters)-1):

    clusterID1 = list(clusters.keys())[i]

    for j in range(i + 1, len(clusters)):

      clusterID2 = list(clusters.keys())[j] 

      # find the closest/farthest/average points in the clustered being compared
      dist = 0
      if method == 'single':
        dist = calc_single_linkage(clusterID1, clusterID2)
      elif method == 'complete':
        dist = calc_complete_linkage(clusterID1, clusterID2)
      elif method == 'average':
        dist = calc_average_linkage(clusterID1, clusterID2)

      if dist < min_dist:
        min_dist = dist
        closest_pair = (clusterID1, clusterID2)
        # identify farthest pairing
        if min_dist > farthest_dist:
          farthest_dist = min_dist
          farthest_clusts = (clusterID1, clusterID2)

  # merge closest pair of clusters
  
  merge(closest_pair[0], closest_pair[1])
  if method == 'test':
    print('\nMerging Clusters', closest_pair[0], '&', closest_pair[1], 'with closest distance of', min_dist)
    print(' Clusters After Last Merge:\n', clusters)


print('\nFarthest Cluster Pairing:', farthest_clusts, 'with a distance of', farthest_dist)
# print timestamp
end = time.time()
print('\n\nTotal Time Elapsed for dataset size of', numPoints, "=", np.round(end - start, decimals= 4), 'seconds.')
