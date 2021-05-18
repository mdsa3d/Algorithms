#Importing packages
using Surrogates, DataFrames, Plots

#preparing the training sample
function f(x)
    x1=x[1]
    x2=x[2]
    sin(x[1]) + cos(x[2])
end
x_train = range(1,10,length=10) |> collect
y_train = range(1,10,length=10) |> collect
z_train = f.(tuple(x_train, y_train))
lower_bound = Float64.(hcat(minimum(x_train), minimum(y_train)))
upper_bound = Float64.(hcat(maximum(x_train), maximum(y_train)))
radial_surrogate = Surrogates.RadialBasis(tuple(x_train, y_train), z_train, lower_bound, upper_bound)

#testing the radial_surrogate
x_test = collect(range(1,10,length=101))
y_test = collect(range(1,10,length=101))
arr = tuple(x_test, y_test)
result = [radial_surrogate(i) for i in arr]

plot(x_train, y_train, z_train, label = "real")
plot!(x_test, y_test, result, label ="surrogate")

#=
x, y = 1:10, 1:10 

p1 = surface(x, y, (x, y) -> surrogate_rbf([x y]))
xs = [a[1] for a in xy]
ys = [a[2] for a in xy]
zs = f.(xy)
scatter!(xs, ys, zs, marker_z=zs, label="Actual Points", title="Surrogates RBF")
=#
