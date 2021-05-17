function insertsort!(a)
    n = length(a)
    for i in 2:n
        j = i - 1
        while j > 0 && a[j] > a[j + 1]
            a[j+1], a[j] = a[j], a[j+1]
            j -= 1
        end 
    end
    return a    
end

insertsort(a) = insertsort!(copy(a))

insertsort (generic function with 1 method)

massive = [1 5 3 4]
insertsort!(massive)

1×4 Array{Int64,2}:
 1  3  4  5

function insertsortperm!(a)
    n = length(a)
    b = []
    for i in 1:n
        push!(b, i)
    end
    for i in 2:n
        j = i - 1
        while j > 0 && a[j] > a[j + 1]
            a[j+1], a[j] = a[j], a[j+1]
            b[j+1], b[j] = b[j], b[j + 1]
            j -= 1
        end 
    end
    return b
end

insertsortperm(a) = insertsortperm!(copy(a))

insertsortperm (generic function with 1 method)

massive = [1 5 3 4]
insertsortperm!(massive)

4-element Array{Any,1}:
 1
 3
 4
 2

massive

1×4 Array{Int64,2}:
 1  3  4  5
