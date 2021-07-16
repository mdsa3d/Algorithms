#= Convert string of vector to a dataframe =#
using JSON, DataFrames
a = "1,1,2,2,2,2,2,2,2,3,3,3,3,3,4,4,4,4,4,5,5,5,5,5,6,6,6,6,6,6,7,7,7,7,8,8,8,9,9,9,9,10,10,10,10,10,10,10,10,10"

a_row = 10
a_col = 5
x = DataFrame(reshape(parse.(Float64, split(a, ',')), a_row, a_col), :auto) # col-wise stacking
y = DataFrame(reshape(parse.(Float64, split(a, ',')), a_col, a_row)', :auto) # row-wise stacking
println("\n x= $x \n y= $y")
