using GLM, DataFrames

df = DataFrame(A=rand(10), B=rand(10))
m = lm(@formula(A ~ B), df)
r2(m)


#= #Example

real = [7.04, 7.19, 9.98, 8.20, 12.95, 12.60]
pred = [5.14, 4.12, 6.34, 5.11, 6.81, 6.12]
df = DataFrame(A=real, B=pred)
m = lm(@formula(A ~ B), df)
r2 = r2(m)

println("\n R2 value is $r2")
=#