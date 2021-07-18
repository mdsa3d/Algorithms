using BenchmarkTools
#The objective of this script is to parse a vector string by identifying whether the data supplied is of type int or float 

a = "1,1,2,2,2,2,2,2,2,3,3,3,3,3,4,4,4,4,4,5,5,5,5,5,6"

# convert the string into a vector of characters

#= original function
function parse_custom_type(var::AbstractString)     
    arr_char = split(var, ',')
    typ = []
    for i in 1:length(arr_char)
        if !occursin(".", arr_char[i])
            push!(typ, Int64)
        elseif occursin(".", arr_char[i])
            push!(typ,Float64)
        end
    end
    if all(typ .== typ[1])
        return parse.(typ, arr_char)
    else
        @warn "data string has mix datatypes of int64 and float64"
    end
end
=#

#optimized function
function parse_custom(var::AbstractString)     
    arr_char = split(var, ',')
    is_float = occursin(".", first(arr_char))
    good = true
    for c in arr_char
        if occursin(".", c) != is_float
            @warn "data string has mix datatypes of int64 and float64"
            good = false
        end
    end
    typ = is_float ? Float64 : Int64
    if good
        return parse.(typ, arr_char)
    end
end

u = @benchmark parse_custom_type(a)
v = @benchmark parse_custom(a)
display(u)
display(v)
