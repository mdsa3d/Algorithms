x = [[1,2,1,3,5] [1,2,3,4,5] [1,2,3,4,5] [1,2,3,4,5]]
#This function will convert a matric to list format (as per python)
list(a) = vec(permutedims([vcat(a[:, i]...) for i in 1:size(a)[2]]))
c = list(x)
println(size(c))


#= list row-wise =#
function list(x::AbstractMatrix; method::String="row")
    if method == "row" 
        return vec([vcat(x[i, :]...) for i in 1:size(x)[1]]) 
    elseif method == "column"
        return vec([vcat(x[:, i]...) for i in 1:size(x)[2]]) 
    end
end


#= 

function list(x::AbstractMatrix; method::String="row")
    if method == "row" 
        return vec([vcat(x[i, :]...) for i in 1:size(x)[1]]) 
    elseif method == "column"
        return vec([vcat(x[:, i]...) for i in 1:size(x)[2]]) 
    end
end

julia> x = hcat([rand(2) for i in 1:3]...)
2×3 Matrix{Float64}:
 0.51  0.81  0.50
 0.32  0.06  0.08

julia> list(x;method="row")
2-element Vector{Vector{Float64}}:
 [0.51, 0.81, 0.50]
 [0.32, 0.06, 0.08]

julia> list(x;method="column")
3-element Vector{Vector{Float64}}:
 [0.51, 0.32]
 [0.81, 0.06]
 [0.51, 0.08]
 =#