using Serialization


#joinpath(pwd(), joinpath(homedir()))
try
    joinpath(pwd(), joinpath(homedir(), "test"))
    mkdir("test") 
catch
    @warn "file already exist"
    println("setting current as storage")

end

for i in 1:10
    y = sin(i) + tan(i)
    try
        mkpath("test/$i")
        open("test/$i/$i.txt", "w") do io
            serialize(io, y)
        end
    catch
        print("something off")
    end
    
end