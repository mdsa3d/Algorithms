function rmse(pred, real)
    rmse_val = sum((pred .- real).^2)/length(pred)
    return rmse_val
end
real = [7.04, 7.19, 9.98, 8.28, 12.95, 12.60, 12.45, 11.5]
pred = [5.14, 4.12, 6.34, 5.11, 6.81, 6.12, 18.42, 6.83]

error = rmse(y_pred_python, y_real)

println("\n RMSE value for pthe data is $error")