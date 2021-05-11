using ScatteredInterpolation

a = [1.0 1.0 13.41; 2.0 1.0 8.60; 3.0 1.0 5.76; 4.0 1.0 3.58; 5.0 1.0 4.69; 6.0 1.0 3.72; 7.0 1.0 6.32; 8.0 1.0 5.68]
x_train = a[:, 1]
y_train = a[:, 2]
z_train = a[:, 3]
samples = z_train
points = [x_train y_train]'
itp = ScatteredInterpolation.interpolate(Multiquadratic(), points, samples);

#testig the interpolated object
x_test = [1.0; 2.28; 2.28; 2.285; 3.57; 4.85; 6.14; 7.42; 8.71; 10.0]
y_test = [1.0; 1.0; 1.0; 1.0; 1.0; 1.0; 1.0; 1.0; 1.0; 1.0]

points_test = [x_test y_test]'
#predicting or evaluating values
interpolated = evaluate(itp, points_test)
println(interpolated)