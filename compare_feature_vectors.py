import numpy as np
from numpy import loadtxt
from math import*

# Using bottleneck files generated after Inception-v3 retrain
# Each bottleneck files contain the fetaure vector (size : 2048) of an image
# This script enables to quantify the similarity between two fetaure vectors using various metrics.

# Convert bottleneck text file to list 
def conv_txt_to_array (filetxt):
    with open(filetxt) as f:
        array = loadtxt(f, delimiter=",", unpack=False)
    f.close()
    return array

# Convert array to list 
def conv_array_to_list (array):
    return array.tolist()   

# Calculate difference betwen two arrays
def cacl_diff(array1, array2):
    return sum(np.subtract(array1, array2))

# Check equality of two arrays with tolereance
# Return number of equal features
def are_equal(array1, array2, rtolerance, atolerance):
    return sum(np.isclose(array1, array1, rtol=rtolerance, atol=atolerance, equal_nan=False))

# Compare the distance between the centers of the two groups
def centers_dist(array1,array2):
    legs = array1.mean(axis=0) - array2.mean(axis=0)
    return np.sqrt(np.sum(legs**2))

# Euclidean Distance
def euclidean_distance(list1,list2):
    return sqrt(sum(pow(a-b,2) for a, b in zip(list1,list2)))

# Manhattan Distance
def manhattan_distance(list1,list2):
    return sum(abs(a-b) for a,b in zip(list1,list2))

# Cosine similarity
# Cosine similarity metric finds the normalized dot product of the two attributes
def square_rooted(x):
    return round(sqrt(sum([a*a for a in x])),3)
 
def cosine_similarity(list1,list2):
    numerator = sum(a*b for a,b in zip(list1,list2))
    denominator = square_rooted(list1)*square_rooted(list2)
    return round(numerator/float(denominator),3)

print "Metrics to quantify the similarity between two fetaure vectors \n"

file_name1 = '_F3759_7889.txt'
file_name2 = '_F3759_7889_copie.txt'

array1 = conv_txt_to_array (file_name1)
list1 = conv_array_to_list (array1)

array2 = conv_txt_to_array (file_name2)
list2 = conv_array_to_list (array2)

print "Sum of all the values in the list"
print "List 1 : " + str(sum(list1))
print "List 2 : " + str(sum(list2))

print "\nCalcul difference betwen arrays"
print cacl_diff(array1, array2)
print "Lower number means more similar. 0 means identical."

rtolerance=0.00001
atolerance=0.00001
print "\nNumber of features considered equal with tolerance rtol = " + str(rtolerance) +" and atol = " + str(atolerance)
print are_equal(array1, array2, rtolerance, atolerance)
print "Higher number means more similar. 2048 means identical."

print "\nCompare the distance between the centers of the two groups"
print centers_dist(array1,array2)
print "Lower number means more similar. 0 means identical."

print "\nEuclidean Distance"
print euclidean_distance(list1,list2)
print "Lower number means more similar. 0 means identical."

print "\nManhattan Distance"
print manhattan_distance(list1,list2)
print "Lower number means more similar. 0 means identical."

print "\nCosine similarity"
print cosine_similarity(list1,list2)
print "two vectors with the same orientation have a cosine similarity of 1"
print "two vectors at 90° have a similarity of 0"
print "two vectors diametrically opposed have a similarity of -1"
