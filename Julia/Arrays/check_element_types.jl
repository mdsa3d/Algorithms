using Base: Int64
using DataFrames, BenchmarkTools
using CUDA
df = DataFrame(:a=>[1, 10], :b=>[2,20], :c=>[3,30], :d=>["x", "y"])
println(typeof(df.a))

t= @benchmark begin
    type_1=[]
    for i in 1:ncol(df)
        if eltype(df[:, i]) == Int64 # check the element type of the column in df dataframe
            output = "this is type Int"
        else
            output = "this is not type Int"
        end
        push!(type_1, output)
    end 
    #println("\n full function for type = $type_1")
end

#for matrix
mat = Array(df)
uf= @benchmark begin
    type_3f =[]
    for i in 1:size(mat)[2]
        if eltype(mat[:, i]) == Int64 # check the element type of the column in df dataframe
            output = "this is type Int"
        else
            output = "this is not type Int"
        end
        push!(type_3f, output)
    end 
    #println("\n full function for type = $type_1")
end

# one line conditional syntax for the above loop
s = @benchmark type_2 = [eltype(df[:, i]) == Int64 ? "this is Int" : "this is not int" for i in 1:ncol(df)]
#println("\n one line function for type = $type_2")

# check for matrix
matrix = Array(df)
u = @benchmark type_3 = [eltype(matrix[:, i]) == Int64 ? "this is Int" : "this is not int" for i in 1:size(matrix)[2]]

# check for CuArray
temp_df = DataFrame(:a=>[1, 10], :b=>[2,20], :c=>[3,30])
temp = Array(temp_df)
cu_1 = CuArray(temp[:, 1])
u_cu = @benchmark type_3 = [eltype(cu_1[:, 1]) == Int64 ? "this is Int" : "this is not int"]
#matrix = [CuArray(temp[:, i]) for i in 1:size(temp)[2]]
#u = @benchmark type_3 = [eltype(matrix[:, i]) == Int64 ? "this is Int" : "this is not int" for i in 1:size(matrix)[2]]

# show full benchmark results with graphics
display(t)
display(s)
display(uf)
display(u)
display(u_cu)
#= Python version
# df.dtypes is returning data-type for each column
data = [{'a': 1, 'b': 2, 'c':3},
        {'a':10, 'b': 20, 'c': 30}]
df = pd.DataFrame(data)
for k in df.dtypes:
    if k == 'int64':
        print("this works")
=#