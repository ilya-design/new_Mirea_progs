function sortkey!(func::Function, a)
    sortkey!(func.(a), a)
end

sortkey! (generic function with 2 methods)

massive = [1 5 7]

function func_(a)  
    return a != 5
end
sortkey!(func_, massive)

1×3 Array{Int64,2}:
 5  1  7

massive

Out[6]:
1×3 Array{Int64,2}:
 5  1  7
