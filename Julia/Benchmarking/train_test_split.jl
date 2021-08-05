using DataFrames, Random, BenchmarkTools

data = DataFrame(:a=>rand(20), :b=>rand(20), :c=>rand(20))

# pct ==> how much percentage you would like to give to training section, 0.7 = 70%
# shuffle ==> for allowing shuffling in the dataset, default is false.
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

u = @benchmark a,b,c,d = train_test_split(data)
display(u)
#println("\n $a, $b, $c, $d")