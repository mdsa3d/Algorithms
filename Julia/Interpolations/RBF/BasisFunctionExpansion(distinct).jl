using BasisFunctionExpansions

#Training dataset
x = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0] 
y = [1.0, 2.0, 1.0, 3.0, 2.0, 4.0, 1.0, 1.0] 
z = [10.41, 9.6, 6.76, 5.58, 4.69, 3.72, 6.32, 5.6]

v = hcat(x_train, y_train)
z = convert(Vector, z_train)

Nv  = [10,10] # Number of basis functions along each dimension
rbf = MultiUniformRBFE(v,Nv, normalize=true) # Approximate using radial basis functions with constant width (Not isotropic, but all functions have the same diagonal covariance matrix)
bfa = BasisFunctionApproximation(z,v,rbf,0.0001) # Create approximation object

#testing dataset
x_test = [1.0, 1.0, 2.28, 2.28, 3.57, 3.57, 4.85, 6.14, 6.14, 6.14, 6.14, 7.42, 7.42, 8.71, 8.71, 10.0]
y_test = [1.0, 1.0, 1.0, 2.0, 3.0, 3.0, 4.0, 4.0, 4.0, 5.0, 6.0, 6.0, 6.0, 8.0, 8.0, 8.0]

v_test = hcat(x_test, y_test)
ẑ = bfa(v_test)