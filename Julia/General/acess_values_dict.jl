Dict1 = Dict("a" => 1, "b" => 2, "c" => "Hello", 4 => 10)
i = "a"
get(Dict1, i) do 
    println(values(Dict1))
    
end
