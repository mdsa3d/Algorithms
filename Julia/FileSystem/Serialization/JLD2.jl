# Serialization using JLD2 module
# Using JLD2 module
using JLD2
  
# Using FileIO module
using FileIO
  
# Declare an array
arr = [1, 2, 3, 4, 5];
  
# Create a file
file = File(format"JLD2", "array.jld2")
  
# Save data into the file
save(file, "arr", arr)

# Load the file
data = load(file)
  
# Display user-visible data
dump(data["arr"])