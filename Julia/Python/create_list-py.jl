x = [[1,2,1,3,5] [1,2,3,4,5] [1,2,3,4,5] [1,2,3,4,5]]
#This function will convert a matric to list format (as per python)
list(a) = vec(permutedims([vcat(a[:, i]...) for i in 1:size(a)[2]]))
c = list(x)
println(size(c))