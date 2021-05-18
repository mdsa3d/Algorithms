# This is a python version of pdist()
# Documentation for the original function can be found on the following link
# https://docs.scipy.org/doc/scipy/reference/generated/scipy.spatial.distance.pdist.html


# importing libraries
from scipy.spatial.distance import pdist
a = [[1,2], [3,4], [5,6], [7,8]]
b = pdist(a)
print(b)

# output --> array([2.82842712, 5.65685425, 8.48528137, 2.82842712, 5.65685425, 2.82842712])