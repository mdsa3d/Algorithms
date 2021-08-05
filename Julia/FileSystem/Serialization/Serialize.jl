using Serialization
point = open("file.jls", "w") do io
    serialize(io, "Lorem ipsum")
    point=position(io)
    println(point)
    serialize(io, Dict(15 => []))
    point = position(io)
    #serialize(io, "Hello, world!")
    serialize(io, "More stuff")
    println(point)
    return point
end
open("file.jls") do io
    seek(io, 68)
    deserialize(io) # this returns "Hello, world!"
end