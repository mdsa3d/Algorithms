using DataFrames, Plots

a = [0.983,1.012,1.036,1.034,1.008,0.942,0.957]
b = [0.945,0.898,0.900,0.860,0.817,0.794,0.753]
c = [0.732,0.722,0.796,0.834,0.810,0.832,0.819]

df = DataFrame(:a=>a, :b=>b, :c=>c)

#=
I think you could try to use a normal line graph but squash it down to a small height and remove the axes and grids
Then for the points you might have to find minima and maxima, that might be a bit more complicated
As in not really complicated but just adds a bit more complexity to the solution.
=#

function sparkline(xs, ys)
    max_y = max(ys...)
    min_y = min(ys...)
    max_locs = []
    min_locs = []
    for x in xs
        ys[x] == max_y && push!(max_locs, x)
        ys[x] == min_y && push!(min_locs, x)
    end

    plot(
        xs, ys,
        grid=false, ticks=false,
        size=(250, 40),
        legend=false,
        xaxis=false, yaxis=false,
        ylims=(min_y-10,max_y+10)
    )
    scatter!(max_locs, repeat([max_y], length(max_locs)), c=:green, markersize=2)
    scatter!(min_locs, repeat([min_y], length(min_locs)), c=:red, markersize=2)
end

res = []

for i in 1:nrow(df)
    a = sparkline(collect(1:ncol(df)), Array(df[i,:]))
    push!(res, a)
end

df[!, :sparkline] = res

CSV.write("discord-sample.csv", df)