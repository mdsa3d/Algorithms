using BasisFunctionExpansions

x = range(1,10,length=10)
y = range(1,10,length=10)

v = [x y]
z = sin.(x) .+ cos.(y) 

Nv  = [10,10] # Number of basis functions along each dimension
rbf = MultiUniformRBFE(v,Nv, normalize=true) # Approximate using radial basis functions with constant width (Not isotropic, but all functions have the same diagonal covariance matrix)
bfa = BasisFunctionApproximation(z,v,rbf,0.0001) # Create approximation object

ẑ   = bfa(v) # Reconstruct signal using approximation object
println(ẑ)