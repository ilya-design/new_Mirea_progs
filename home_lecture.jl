function length(A)
    len = 0
    for _ in A
        len +=1
    end
    return len
end


function sum(A)
    s=eltype(A)(0)
    for a in A
        s+=a
    end
    return s
end


function prod(A)
    p=eltype(A)(1)
    for a in A
        p*=a
    end
    return p
end


function maximum(A)
    M = typemin(eltype(A))#минимальное значение для входного типа
    for a in A
        M=max(M,a)
    end
    return M
end

#=function argmax(A)
    @assert !isempty(A)
    imax = 1
    for k in eachindex(A)
        if A[k] > A[imax]
=#


function polyval(A)
    Q= a[1]#это а_0
    for a in @view A[2:end]
        Q=Q*x+a
    end
    return Q
end

function insertsort!(A)
    n=length(A)
    for k in 1:n-1
        end_insert!(@view A[1:k+1])
    end
    return A
end
function end_insert!(A)
    k=length(A)
    while A[k-1]>A[k]
        A[k-1],A[k]=A[k],A[k-1]
    end
end
"""
y=F([])#значение индуктивной функции на пустой последовательности
for a in A[2:end]
    y=op(y,a)
end
"""
#Пример
y=F([1])#значение индуктивной функции на подпоследовательности,содержащей только 1-й элемент А 
for a in A[2:end]
    y=op(y,a)#аналогично y=y+a,если op-сложение
end

reduce(op,itr;[init])#функция высшего порядка для вычисления индуктивных функций
#op-аргумент типа Function определяющий рекрсивную операцию(+,-,*,/...)
#itr-итерируемый объект(например массив)
#[init]-необязательная инициализация(инициализация "y" сверху)  

product=reduce(*,a;init=1)
op(Q,a)=Q*x+a


polyval(a,x)=reduce((Q,ak)->Q*x+ak, a)#функция для нахождения результата при опр.x для многочлена (сначала коэффициенты для a,справа значение x)
