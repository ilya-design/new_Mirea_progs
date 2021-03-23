julia> insertsort!(A)=reduce(1:length(A))do _, k
       while k>1 && A[k-1]>A[k]
       A[k-1],A[k] = A[k],A[k-1]
       k-=1
       end
       return A
       end
insertsort! (generic function with 1 method)

julia> A=[7,3,5,8,9] #пример массива
5-element Array{Int64,1}:
 7
 3
 5
 8
 9

julia> insertsort!(A) #результат сортировки
5-element Array{Int64,1}:
 3
 5
 7
 8
 9
