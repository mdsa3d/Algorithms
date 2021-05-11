#= This code uses linear radial for the rbf computation, to change the radial the user may do the following:
Surrogates.RadialBasis(xy,z,lb,ub;rad = multiquadricRadial) =#

#Importing Packages
using Surrogates
using Plots; plotly()

#defining lower and upper bound of the sample : lb = [minimum(x), minimum(y)]; ub = [maximum(x), maximum(y)]
lb = [0.0, 0.0]
ub = [10.0, 10.0]

function f(x)
    x1=x[1]
    x2=x[2]
    sin(x[1]) + cos(x[2])
end

#Sampling
function sam()
    x = range(0, 10.0, length = 9) |> collect
    y = range(0, 10.0, length = 9) |> collect
    tuple = zip(x,y) |> collect
    return tuple
end

xy = sam()
z = f.(xy)

# creating a radial object 
surrogate_rbf = Surrogates.RadialBasis(xy, z, lb, ub)

# The user may choose to optimize the function using the following expression, for details please refer to the main documentation.
#Surrogates.surrogate_optimize(f, SRBF(), lb, ub, surrogate, SobolSample())

#Predicting values for the test_sample
function test_val()
    x = range(0, 10.0, length = 101) |> collect
    y = range(0, 10.0, length = 101) |> collect
    tuple = zip(x,y) |> collect
    return tuple
end
arr = test_val()

#prediction
result_surrogates_radial = [surrogate_rbf(i) for i in arr]


#Plotting
x, y = 1:10, 1:10 

p1 = surface(x, y, (x, y) -> surrogate_rbf([x y]))
xs = [a[1] for a in xy]
ys = [a[2] for a in xy]
zs = f.(xy)
scatter!(xs, ys, zs, marker_z=zs, label="Actual Points", title="Surrogates RBF")