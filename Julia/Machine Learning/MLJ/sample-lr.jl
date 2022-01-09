using Pkg
Pkg.activate("$(joinpath(@__DIR__, "/MachineLearning/MLJEnv"))")

using MLJLinearModels, MLJ
@load LinearRegressor pkg=MLJLinearModels verbosity=0;

a= [0.45, 0.41, 0.51, 0.52, 0.81, 0.51, 0.53, NaN, 0.5, 0.38, 0.51, 0.53, 0.53, 0.58, 0.34, 0.64, 0.52, 0.62, 0.57, 0.59, 0.35]
b= [0.91, 1.12, 0.95, 0.95, 0.93, 0.75, 0.94, 0.52, NaN, 0.69, 0.97, 0.94, 0.94, 0.91, 1.25, 0.77, 1.16, 0.91, 0.99, 1.0, 0.99]
c= [0.01, 0.23, 0.42, -0.02, 0.05, -0.0, 0.16, 0.33, NaN, 0.49, 0.17, 0.26, 0.16, 0.0, 0.26, 0.17, 0.1, -0.24, -0.09, 0.11, -0.07]

function lr(x1, x2, y)
    model = LinearRegressor()
    xs = MLJ.table(hcat(x1, x2))
    lr_model = machine(model, xs, y);
    MLJ.fit!(lr_model, verbosity=0);
    y_hat = MLJ.predict(lr_model, xs);
    return sum((y_hat .- y).^2)   
end

lr(a,b,c)

