using BenchmarkTools
# creating a matrix
a = hcat(rand(1:5, 100), rand(1:5, 100), rand(1:5, 100))
#creating a vector
b = rand(1:5, 100)
#=
This goal of this script is to build a faster sorting algorithm.
The criterion: 
                1. Stable
                2. Faster
                3. Fewer Allocations (If possible)
=#

# Lazy implementation uses a Base.sortslices() to sort a matrix.
function sort_lazy(v::AbstractMatrix)
    return sortslices(v, dims=1, by=x->x[2], rev=false)
end

function sort_lazy(v::AbstractVector)
    return sort!(v)
end

# Indices method tried to use sortperm() as an intermediate.
# This will build the sorting order of the indices and then changes their position according to the index_vector.
function sort_indices(v::AbstractMatrix, column::Int64)
    return v[sortperm(v[:, column]), :]
end

function sort_indices(v::AbstractVector)
    return v[sortperm(v)]
end

println("Testing Matrix Operations")
println("comparing results")
println(isequal(sort_lazy(a), sort_indices(a)))

println("Lazy Sorting")
@btime sort_lazy(a)
println("Sorting wrt indices")
@btime sort_indices(a)

println("Testing Vector Operations")
println("comparing results")
isequal(sort_lazy(b), sort_indices(b))

println("Lazy Sorting")
@btime sort_lazy(b)
println("Sorting wrt indices")
@btime sort_indices(b)
