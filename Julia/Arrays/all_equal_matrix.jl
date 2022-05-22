using Base.Threads;

a = hcat(ones(10), rand(10), rand(1:5, 10))
b = hcat(ones(10000), rand(1:5, (10000,10000)));
@inline function all_equal(x)
    length(x) < 2 && return true
    e1 = x[1]
    i = 2
    @inbounds for i=2:length(x)
        x[i] == e1 || return false
    end
    return true
end

@inline function check_matrix_mlt(a)
    capture = [[] for _ in 1:Threads.nthreads()]
    @threads for i in 1:size(a,2)
        @views all_equal(a[:, i]) == true ? push!(capture[threadid()], i) : continue
    end
    return reduce(vcat, capture)
end

@inline function check_matrix(a)
    capture = []
    @inbounds for i in 1:size(a,2)
        @views all_equal(a[:, i]) == true ? push!(capture, i) : continue
    end
    return capture
end


println("Benchmarking the Code")
using BenchmarkTools

println("Single Threaded")
@btime check_matrix(b)

println("Multi Threaded")
@btime check_matrix_mlt(b)
 
# It was noticed from the testing (Benchmarking) that the multi-threaded version is faster than the single-threaded version, only when the matrix is larger than roughly 10,000 x 10,000.