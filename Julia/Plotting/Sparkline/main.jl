using CSV, PyCall, DataFrames
sparkline_python = pyimport("sparklines")
data = CSV.read("Sparkline\\data.csv", DataFrame)
spark = []
for i in 1:nrow(data)
    m = sparkline_python.sparklines(Array(data[i, 1:ncol(data)]))
    push!(spark, m)
end
data[!, :spark] = spark
println(data)
CSV.write("Sparkline\\sparkline-dataset.csv", data)
