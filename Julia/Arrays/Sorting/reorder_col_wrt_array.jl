using DataFrames, BenchmarkTools

df = DataFrame(:a=> rand(10), :b=>rand(10), :c=>rand(10))
order = [3,1,2]

#reorder cols of df
df = select!(df, order)

#to reorder an array or matrix the dev can use reshape()
arr = [1 2 3 4 5 6 7]
order = [6,3,4,5,1,7,2]
u = @benchmark arr_a = arr[reshape(order, 1, :)]
println(arr_a)
println(size(arr_a))

v = @benchmark arr_b = arr[:,order]
println(arr_b)
println(size(arr_b))

println("reshape method")
display(u)
println("direct method")
display(v)