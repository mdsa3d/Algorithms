#= This script convert a shape [a,b] provided as string value back to vector =#

x ="[50, 3]"

b = parse.(Int64, split(strip(x, ['[',']']), ','))
println(typeof(b))

a = b[1]
e = b[2]

println("a is $a e is $e")
