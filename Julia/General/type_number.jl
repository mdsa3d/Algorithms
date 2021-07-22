# The goal is to test supertype for all number types in julia, replicating "numpy.number"

#=Python
df = pd.DataFrame({'A': [1, 2, 3], 'B': [1.0, 2.0, 3.0], 
                   'C': [1j, 2j, 3j], 'D': ['a', 'b', 'c']})
df
Out: 
   A    B   C  D
0  1  1.0  1j  a
1  2  2.0  2j  b
2  3  3.0  3j  c

df.dtypes
            Out: 
            A         int64
            B       float64
            C    complex128
            D        object
            dtype: object

np.issubdtype(df['A'].dtype, np.number)
Out: True

np.issubdtype(df['B'].dtype, np.number)
Out: True

np.issubdtype(df['C'].dtype, np.number)
Out: True

np.issubdtype(df['D'].dtype, np.number)
Out: False
=#

#Julia

using DataFrames
df = DataFrame(:A=> [1, 2, 3], :B=> [1.0, 2.0, 3.0], :C=> [1+0im, 2+0im, 3+0im], :D=> ["a", "b", "c"])

bool_val = [(eltype(df[:, i]) <: Number ? "succeed" : "fails") for i in 1:size(df)[2]]

