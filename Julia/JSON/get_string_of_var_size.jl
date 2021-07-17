using DataFrames

#create a dataframe
df = DataFrame()
df.a = [i for i in 1:20]
df.b = [i for i in 1:20]
df.c = [i for i in 1:20]
println("the size of the dataframe is $(size(df))")

# the goal is to convert the size into string with a format "[i, j]"
function get_string_size(var)
    rows, columns = size(var)[1], try size(var)[2] catch; size(reshape(var, :, 1))[2] end
    result = string("[", rows, ",", columns, "]")
    return result
end 

# vector
test_vec = [1,2,3,4,5,65,6]
println("the size of the vector is $(size(test_vec))")

#array (matrix)
test_array = [1 2; 3 4; 5 65; 6 1; 2 3; 4 5; 65 6]
println("the size of the test array is $(size(test_array))")

# testing

size_df_string = get_string_size(df)
size_vec_string = get_string_size(test_vec)
size_array_string = get_string_size(test_array)

println("\n The string variable for sizes:\n\t\t\t DataFrame = $size_df_string \t type = $(typeof(size_df_string)) \n\t\t\t Vec = $size_vec_string \t type = $(typeof(size_vec_string)) \n\t\t\t Array = $size_array_string \t type = $(typeof(size_array_string))")
