using Pkg
Pkg.activate("$(joinpath(@__DIR__, "../GLMEnv"))")

using GLM, DataFrames, CSV

X = round.(rand(5,2), digits=2)
y = round.(rand(5), digits=2)
model = lm(X, y)
y_hat = predict(model, X)
score = sum((y_hat .- y).^2)
println("\nscore for the linear regressor: $score")