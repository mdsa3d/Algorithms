using DataFrames, BenchmarkTools
#data = DataFrame(:x1 => rand(20), :x2 => rand(20), :x3 => rand(20))

x1 = repeat(1:10, inner=100)
x2 = repeat(repeat(1:10, inner=10), outer=10)
x3 = repeat(repeat(1:10, inner=1), outer=100)

data = DataFrame(:x1 => x1, :x2 => x2, :x3 => x3)

function minmax(var::DataFrame)
    min = [minimum(i) for i in eachcol(var[:, 1:ncol(var)])]
    max = [maximum(i) for i in eachcol(var[:, 1:ncol(var)])]
    return min, max
end

function minmax(var::AbstractMatrix)
    min = minimum(var, dims=1)
    max = maximum(var, dims=1)
    return min, max
end
val = Array(data)
u = @benchmark minmax(data)
v = @benchmark minmax(val)

display(u)
display(v)
