using DataFrames, BenchmarkTools

#create a dataframe
df = DataFrame()
df.a = [i for i in 1:20]
df.b = [i for i in 1:20]
df.c = [i for i in 1:20]
println("the size of the dataframe is $(size(df))")

# the goal is to convert the size into string with a format "[i, j]"
# full function 
#=
function get_string_size(var)
    if (typeof(var) == DataFrame || typeof(var) == AbstractMatrix)
        #rows, columns = size(var)[1], size(var)[2] 
        return string("[", size(var)[1], ",", size(var)[2], "]")
    elseif (typeof(var) == AbstractVector)
        #rows, columns = length(var), 1
        return string("[", length(var), ",", 1, "]")
    end
end
=#

#Inline function based on the types (multiple dispatch)
get_string_size(var::DataFrame) = string("[", size(var)[1], ",", size(var)[2], "]")
get_string_size(var::AbstractMatrix) = string("[", size(var)[1], ",", size(var)[2], "]")
get_string_size(var::AbstractVector) = string("[", size(var)[1], ",", 1, "]")

# vector
test_vec = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
println("the size of the vector is $(size(test_vec))")

#array (matrix)
test_array = Array(df)
println("the size of the test array is $(size(test_array))")

# testing
u = @benchmark size_df_string = get_string_size(df)
v = @benchmark size_vec_string = get_string_size(test_vec)
z = @benchmark size_array_string = get_string_size(test_array)

println("\n The string variable for sizes:\n\t\t\t DataFrame = $size_df_string \t type = $(typeof(size_df_string)) \n\t\t\t Vec = $size_vec_string \t type = $(typeof(size_vec_string)) \n\t\t\t Array = $size_array_string \t type = $(typeof(size_array_string))")

println("DataFrame")
display(u)
println("Vector")
display(v)
println("Array")
display(w)

#= Benchmarking results for the 1st column of the dataframe presented in dataframe, array, and vector
types --> dataframe     vector      matrix      type_of_funcn
time(ns)     507          476         478       full
             543          457         478       inline
=#
