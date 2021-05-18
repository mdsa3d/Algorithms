# This is a julia implementation of pdist() taken from scipy library (python)
# pdist() to calculate the distance using pairwise computation and returning a symetric array

function pdist(x)
    dist = pairwise(Euclidean(), x, dims=1)
    result = [dist[i, j] for i=1:size(dist)[1]-1 for j=i+1:size(dist)[2]]
    return result
end

a = [1 2; 3 4; 5 6; 7 8]
pdist(a)

# Output --> [2.82842712, 5.65685425, 8.48528137, 2.82842712, 5.65685425, 2.82842712]