x = [1,2,3,4,5,6]
x_s ="[3, 2]"

b = parse.(Int64, split(strip(x_s, ['[',']']), ','))
println("b is $b")

a = b[1]
e = b[2]

println("a is $a e is $e")

x_new = transpose(reshape(x,a,e))
println(x_new)