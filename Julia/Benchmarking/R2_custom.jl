using Statistics
function rSquared(prediction, observation)
    corCoef = cor(prediction, observation)
    r2 = corCoef^2
    return r2
end


#= #Example
real = [7.3, 7.1, 9.9, 8.20, 12.9, 12.50]
pred = [5.4, 6.4, 2.1, 3.4, 5.64, 6.75]
rSquared(pred, real)
=#