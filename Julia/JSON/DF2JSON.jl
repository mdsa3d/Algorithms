using CSV, DataFrames, BenchmarkTools

df = DataFrame(rand(1:5, (5,2)), ["a", "b"])

function dftojson(df)
    s = size(df);
    n = join(names(df), ",")
    d = @views vcat(Array(df)...);
    obj = replace(replace("{col_name: [$n], data: $d, size: $s}", "(" => "["), ")" => "]")
    return obj
end

@btime dftojson(df)

dftojsonV2(df) = replace(replace("{col_name: [$(join((names(df)), ","))], data: $(vcat(Array(df)...)), size: $(size(df))}", "(" => "["), ")" => "]")

@btime dftojsonV2(df)