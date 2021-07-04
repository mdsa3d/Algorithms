## joining df with different cols
a = DataFrame(:x => [1,2,3]) # a has 3 elements, while b has 5
insertcols!(a,1,:id => axes(a,1)) # idea is to add index to each df and outerjoin them
b = DataFrame(:y => [1,2,3,4, 5])
insertcols!(b,1,:id => axes(b,1))
d = select(outerjoin(b,a, on =:id), Not(:id))
e = select(outerjoin(a,b, on =:id), Not(:id))
      
## getting col name of df
nm = names(d)

## renaming col
DataFrames.rename!(d, Symbol.(["date","Price"]))
  
## transposing df
df = DataFrame(A = 1:4, B = 5:8, AA = 15:18)
DataFrame([[names(df)]; collect.(eachrow(df))], [:column; Symbol.(axes(df, 1))])

# use makeunique = true to prevent cols with same name
