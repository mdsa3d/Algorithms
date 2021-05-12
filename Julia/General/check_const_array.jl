all_equal(itr) = length(itr)==0 || all( ==(itr[1]), itr)

#= Working Example

a = [1, 1, 1]
b = [1, 2, 3]

arr1 = all_equal(a)
arr2 = all_equal(b)
println("\n arr1 has unique elements $arr1
\n arr2 has unique elements $arr2")
=#

#= Output will be :
 arr1 has unique elements true
 arr2 has unique elements false
=#