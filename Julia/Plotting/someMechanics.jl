### for more info, please visit http://docs.juliaplots.org/latest/generated/plotly/#plotly-ref29
## creating data
v = 1:1:10
v2 = 11:1:20
v3 = 21:1:30

## heatmap for 1 serie
a3x = [i for i in 1:10]
a3y = ["v2"]
# if only 1 serie need to resize it
a3 = heatmap(a3x, a3y,
  reshape(v2,(1,size(v2,1))),
  xticks =nothing, legend = false
)

a4y = ["v3"]
a4 = heatmap(a3x, a4y,
  reshape(v3,(1,size(v3,1))),
  xticks =nothing, legend = false
)

## heatmap for multiple series
x = [i for i in 1:10]
y = ["v","v2","v3"]
d = transpose(hcat(v,v2,v3))
  
heatmap(x, y, d,
  xticks =:auto, ytickfontsize = 6,
  legend = true #or false
)

## creating layout
plot(a4, a3, layout= @layout([a;b]))

## setting floating plot in another plot using "inset" and "bbox"
# have the main plot first
d = data[!,:date]
p = data[!,:price]
p1 = plot(d,p, subplot =1, label = "main plot")

# add the second plot: in this case heatmap
xs = [i for i in d]
ys = ["var1", "var2", "var3"]
d2 = transpose(hcat(v,v2,v3))
heatmap!(xs, ys, d2,
  xticks =:auto, ytickfontsize = 6,
  inset = (1, bbox(0.025, 0, 0.95, 0.3, :bottom)), #(x,y,w,h)
	subplot = 2,
  legend = true #or false
)
