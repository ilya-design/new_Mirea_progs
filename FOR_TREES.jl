Представление дерева связанными структурами.

Структура, представляющая узел бинарного дерева:

mutable struct BiTree{T}
    index::T
    left::Union{BiTree{T},Nothing}
    right::Union{BiTree{T},Nothing}
    BiTree{T}(index) where T = new(index,nothing,nothing)
end

BTI = BiTree{Int} t = BTI(1) t.left = BTI(2) t.right = BTI(3)

Структура, представляющая узел дерева с произвольной валентностью (по выходу):

struct Tree{T}
    index::T
    sub::Vector{Tree{T}}}
    Tree(index)=new(index, Tree{T}[])
end

Структура, представляющая узел дерева с фиксированной валентностью по выходу:

struct NTree{N,T}
    index::T
    sub::Vector{<:Union{NTree{N,T}, Nothing}}
    NTree{N,T}(index) where {N,T} = new(index, [nothing for _ in 1:N])
end


АЛГОРИТМЫ ОБХОДА КОРНЕВЫХ ДЕРЕВЬЕВ

Например, если дерево представлено вложенными векторами, и под обработкой корня понимать просто вывод на печать значения его индекса, то в случае обхода сверху-вниз программный код будет выглядеть так:

function toptrace(f::Function, tree::Vector)
    println(tree[end]) # на последней позиции в tree находится индекс корня
    for subtree in tree[1:end-1] # с первой до предпоследней поциции нахоятся поддеревья
        toptrace(subtree)
    end
end
Соответственно обход (обработка) снизу-вверх будет выглядеть так:

function downtrace(tree::Vector)  
    for subtree in tree[1:end-1] 
        downtrace(subtree)
    end
    println(tree[end])
end

При всех других способах кодирования деревьев алгоритмы обхода будут выглядеть подобным образом, различаясь лишь в мелких деталях, связанных со спецификой выбранного способа кодирования.

Напимер, если дерево представлено типом NTree{N,T}, то тот же самый обход сверху-вниз записывается так:

function toptrace(tree::NTree{N,T}) where {N,T}
    println(tree.index)
    for i in 1:N
        toptrace(tree.sub[i])
    end
end
А если дерево представлено типом Tree{T}, то - так:

function toptrace(tree::Tree{T}) where T
    println(tree.index)
    for sub in tree.sub
        toptrace(tree.sub)
    end
end

В случае же, если дерево представлено списком смежностей, код будет выглядеть так:

ConnectList{T} = Vector{Vector{T}} 

function toptrace(rootindex::T, tree::ConnectList{T}) where T
    println(rootindex)
    for subindex in tree[rootindex]
        toptrace(subindex, tree)
    end
end
