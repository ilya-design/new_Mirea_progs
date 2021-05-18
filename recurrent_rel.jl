4.1. Вычисление высоты дерева
Высота дерева - это набольшая длина пути к его концевым вершинам (листьям); по определению длина пути к корню дерева равна 1.

Пусть имеется некоторое дерево с $n$ поддеревьми, непосредственно связанных с его корнем, и нусть известно, что высоты этих поддеревьев равны $h_1,h_2,...,h_n$. Тогда для высоты $h$ всего дерева справедлива рекуррентная вормула: $$ h=\max{h_1,...,h_n}+1 $$

Этой формуле соответствует следующая рекурсивная функция:

function height(tree::Tree)
    h=0
    for sub in tree.sub
        h = max(h,height(sub))
    end
    return h+1
end
  
  4.2. Подсчет всех вершин дерева
При подсчете числа всех вершин поступим аналогично: сначала запишем требуемую рекурреную формулу, из которой затем выведем соответствующую ей рекурсивную функцию.

Пусть $N_1,...N_n$ - числа вершин всех $n$ поддеревьев, связанных с корнем некоторого дерева. Тогда число вершин $N$ самого дерева, очевидно, равно: $$ N=N_1+...+N_n+1 $$

Полученной рекуррентной формуле соответствует следующая рекурсивная функция:

function vernumber(tree::Tree)
    N=1
    for sub in tree.sub
        N += vernumber(sub)
    end
    return N
end
4.3. Подсчет числа листьев дерева
Пусть $N_1,...N_n$ - числа листьев во всех $n$ поддеревьях, связанных с корнем некоторого дерева. Тогда число листьев $N$ в самом дереве, очевидно, равно: $$ N=\begin{cases}

1 &, если\ дерево\ состоит\ только\ из\ корня\ N_1+...+N_n &, в\ противном\ случае \end{cases} $$

Полученной рекуррентной формуле соответствует следующая рекурсивная функция:

function leavesnumber(tree::Tree)
    if isempty(tree.sum)
        return 1
    end
    N=0
    for sub in tree.sub
        N += leavesnumber(sub)
    end
    return N
end
4.4. Определение максимальной валентности вершин дерева
Пусть $p_1,...p_n$ - наибольшие валентности по выходу во всех $n$ поддеревьях, связанных с корнем некоторого дерева. Тогда наибольшая валентность по выходу $p$ в самом дереве, очевидно, равна: $$ p=\max{\max{p_1,...,p_n}, валентность_корня} $$

Этой рекуррентной формуле соответствует следующая рекурсивная функция:

function maxvalence(tree::Tree)
    p=length(tree.sub)
    for i in tree.sub
        p = max(p, maxvalence(sub))
    end
    return p
end
4.5. Вычисление средней длины пути к вершинам дерева
Практическая важность величины среднего пути к вершинам дерева определяется тем, что она пропорциональна среднему времени доступа к данным, хранящимся в узлах дерева.

Чтобы её найти потребуется сначала вычислить суммарную длину пути ко всем вершинам и число всех вершин. После чего, поделив первое на второе, получим искомую характеристику.

Рекуррентная формула для вычисления числа всех вершин нам уже известна: $$ N=N_1+...+N_n+1 $$ где $N_1,...N_n$ - числа вершин всех $n$ поддеревьев, связанных с корнем некоторого дерева.

Рекуррентная формула для суммарной длины длины пути: $$ S=S_1+...+S_n+N $$ где $S_1,...,S_n$ суммы длин путей к каждой вершине всех поддеревьев, $N$ - число вершин во всём дереве. К сумме длин путей в каждом из поддеревьев по отдельности $S_1+...+S_n$ надо прибавить ещё число всех вершин дерева $N$ потому, что длины путей ко всем вершинам каждого поддерева, отсчитываемых от его корня, при переходе к отсчету от корня самого дерева увеличиваются на 1 (включая сам корень, так как длина пути к корню считается равной 1).

Соответствующая функция, возвращающая кортеж из величин $S, N$ записывается так:

function sumpath_numver(tree::Tree)
    N=1
    S=0
    for sub in tree.sub
        s, n = sumpath_numver(sub)
        S += s
        N += n
    end
    return S, N
end
Поскольку эта функция самостоятельного значения не имеет, то её можно обернуть во внешнюю не рекурсивную функцию, возвращающую уже требуемый результат:

function meanpath(tree::Tree)

    function sumpath_numver()
        N=1
        S=0
        for sub in tree.sub
            s, n = sumpath_numver(sub)
            S += s
            N += n
        end
        return S, N
    end

    S, N = sumpath_numver()
    return S/N
end