julia> function nummax(A)
       k=0
       max=1
       A[max]=A[1]
       for i in 1:length(A)
       if A[max]==A[i]
       k+=1
       end
       if A[max]<A[i]
       max=i
       k=1
       end
       end
       return k
       end
nummax (generic function with 1 method)

julia> A=[7,7,7,7,5,4,8,8,8,7]# пример массива
10-element Array{Int64,1}:
 7
 7
 7
 7
 5
 4
 8
 8
 8
 7

julia> nummax(A)#результат функции
3
