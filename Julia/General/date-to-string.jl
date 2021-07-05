#=The purpose of this script is to create a code
which can capture the current date and time and 
store it as a string variable of continuous numbers. =#

using Dates

dt = Dates.format(now(), "YmdHMS")

println(typeof(dt))
println(dt)