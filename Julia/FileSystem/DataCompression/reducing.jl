using Serialization, XLSX, CSV, DataFrames
data = ("C:\\Users\\saads\\Desktop\\fathi\\PRSB\\Reducing\\wellx_pdg_data.csv")
csv_data = CSV.read(data, DataFrame)
println("\n csv data before serialization $(csv_data[1:5, :])")
#xf = XLSX.readxlsx(file)
#data = Array(xf["welltest_223"])

open("fathi.jld", "w") do io
    serialize(io, data)
end
#
d_file = open("fathi.jld") do io
    deserialize(io) # this returns "Hello, world!"
end

d_data = CSV.read(d_file, DataFrame)
println("\n csv data after serialization $(d_data[1:5, :])")

