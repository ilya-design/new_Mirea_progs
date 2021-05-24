function quicksearch(iter,val)
    left = 1
    right = length(iter)
    while left < right && val != iter[div(left + right, 2)]
        if val > iter[left]
            left = left+1
        end
        if val < iter[right]
            right = right-1
        end
    end
    midl = div(left + right, 2)
    if val != iter[midl]
        if val < iter[midl]
            midl = midl-1
        elseif val>iter[midl]
            midl=midl+1
        end
    end
    return midl
end

quicksearch (generic function with 1 method)


function insertsort!(a)
    for k in 2:length(a)
        ind = quicksearch(a[1:k-1], a[k])
        if ind == 0
            ind = 1
        end
        insert!(a, ind, a[k])
        deleteat!(a, k+1)
    end
    return a
end

insertsort! (generic function with 1 method)



massive = [1, 5, 3, 4]
insertsort!(massive)

4-element Array{Int64,1}:
 1
 3
 4
 5
