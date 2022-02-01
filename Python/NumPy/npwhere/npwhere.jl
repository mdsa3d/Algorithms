using CSV, DataFrames, Statistics

df = CSV.read(download("https://raw.githubusercontent.com/krishnaik06/All-Hyperparamter-Optimization/master/diabetes.csv"), DataFrame)
#df[!, :Insulin] = Float64.(df[:, :Insulin])
df[!, :Insulin] = replace!(Float64.(df.Insulin), 0 => Statistics.median(df.Insulin))
df[!, :Glucose] = replace!(Float64.(df.Glucose), 0 => Statistics.median(df.Glucose))
println(df)