function atleast_2d(x)
    return ndims(x) == 1 ? reshape(x, :, 1) : x
end

a = [1; 3 4; 5 6; 7 8]
atleast_2d(a)