using CSV, DataFrames, Random

file = download("https://raw.githubusercontent.com/izzatdarani/placeholder/master/dataset/basic.csv")
data = CSV.read(file, DataFrame)

function train_test_split(df; pct=0.7, shuffle=false)
    @assert 0 <= pct <= 1
    if (shuffle==false)
        ids = collect(axes(df, 1))
    else
        ids = shuffle!(collect(axes(df, 1))) #shuffle!(ids)
    end
    sel = ids .<= nrow(df) .* pct
    x = view(df, sel, :)
    y = view(df, .!sel, :)
    y_train = Array(view(x, :, 1))
    x_train = Array(view(x, :, 2:ncol(x)))
    y_test = Array(view(y, :, 1))
    x_test = Array(view(y, :, 2:ncol(y)))
    return x_train, x_test, y_train, y_test
end

a,b,c,d = train_test_split(data)

println("\n $a, $b, $c, $d")