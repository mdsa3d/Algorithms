# importing packages
using Stheno
using Surrogates
using Plots
plotly()
#creating a function which will take a array of Array{Tuple{Float64,Float64},1}
# and extract two float values as x[1] and x[2]
#then return a value through operation on equations
function f(x)
    x1=x[1]
    x2=x[2]
    sin(x[1]) + cos(x[2])
end

#Sampling 
#Since the kriging fucntion for 3D only accepts Array{Tuple{Float64,Float64},1} and Array{Float64},1
#as input hence this function will prepare the sample for the execution
function sam()
    x = range(0, 10.0, length = 9) |> collect
    y = range(0, 10.0, length = 9) |> collect
    tuple = zip(x,y) |> collect
    return tuple
end

xy = sam() # a combination of x and y coordinates
z = f.(xy) # z coordinates

# plot the actual values
scatter(getindex.(xy,1),getindex.(xy,2),z,title = "Stheno + Surrogate", label = "actual",
    shape = :star5)

# perform kriging interpolation using SthenoKriging custom function
surrogate = SthenoKriging(xy, z)

# prepare a sample to test the prediction accuracy of the model
function test_val()
    x = range(0, 10.0, length = 101) |> collect
    y = range(0, 10.0, length = 101) |> collect
    tuple = zip(x,y) |> collect
    return tuple
end
arr = test_val()

# take the outputs as an array
result_stheno_surrogate = [surrogate(i) for i in arr]

#plotting
x, y = 0:10, 0:10 

p1 = surface(x, y, (x, y) -> surrogate([x y]))
xs = [a[1] for a in xy]
ys = [a[2] for a in xy]
zs = f.(xy)
scatter!(xs, ys, zs, marker_z=zs, label = "Actual Points", title="Stheno Kriging")