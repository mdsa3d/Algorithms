using Serialization # Serialize package to convert an object to serial type

#create directory
function create_dir(name)
    cd(homedir()) 
    mkdir("$name")
end

#Storage function
function storage(value, ref)
    #create directory for storing the files
    try
        create_dir("Test_Storage")
    catch
        @warn "folder already exist"
        println("setting existing folder as storage directory")
    end
    # storing the model
    open("$(mkpath("$(joinpath(homedir(), "Test_Storage"))\\$ref"))\\$ref.jls", "w") do io
        serialize(io, value)
    end
end

a = [1,2,3,4]
b = "test"

storage(a, b)
