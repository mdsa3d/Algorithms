a = DataFrame(:x => [1,2,3]) # a has 3 elements, while b has 5
insertcols!(a,1,:id => axes(a,1)) # idea is to add index to each df and outerjoin them
b = DataFrame(:y => [1,2,3,4, 5])
insertcols!(b,1,:id => axes(b,1))
d = select(outerjoin(b,a, on =:id), Not(:id))
e = select(outerjoin(a,b, on =:id), Not(:id))
