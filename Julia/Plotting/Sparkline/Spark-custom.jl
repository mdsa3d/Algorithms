using CSV, DataFrames

function spark2(v::Vector{<:Real};max_offset::Int=6)
    @assert max_offset > 1
    mi,ma = extrema(v)
    v_shift = floor.(Int,(max_offset - 1) .* ( (v .- mi) ./ (ma == mi ? 1 : ma-mi)))
    [repeat(" ",k)*"⃝" for k in v_shift]
end

#data = CSV.read("data.csv", DataFrame)

a = DataFrame(normal = spark2(cumsum(randn(50))), random = spark2(rand(50)))