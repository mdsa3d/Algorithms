using DataFrames

df = DataFrame(:a=> rand(10), :b=>rand(10), :c=>rand(10))
order = [3,1,2]

#reorder cols of df
df = select!(df, order)

#to reorder an array or matrix the dev can use reshape()
arr = [1 2 3 4 5 6 7]
order = [6,3,4,5,1,7,2]
arr = arr[reshape(order, 1, :)]
println(arr)
println(size(arr))