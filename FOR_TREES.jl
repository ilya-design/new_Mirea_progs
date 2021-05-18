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
