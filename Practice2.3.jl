function non_decreasing_amounts(a)
    return sum(a)
end

function non_decreasing_zeroz(a)
    return count(i->(i==0), a)
end

non_decreasing_zeroz (generic function with 1 method)

function sort1!(matrix)
    vec_colons = [@view matrix[:,j] for j in 1:size(matrix,2)]
    vec_colons = sortkey!(non_decreasing_amounts, vec_colons)
    matrix = hcat(hcat(vec_colons...))
    return matrix
end

function sort2!(matrix)
    vec_colons = [@view matrix[:,j] for j in 1:size(matrix,2)]
    vec_colons = sortkey!(non_decreasing_zeroz, vec_colons)
    matrix = hcat(hcat(vec_colons...))
    return matrix
end

sort2! (generic function with 1 method)

massive = [
    1 3 5 
    0 9 4 
    2 102 10 
]
sort1!(massive)

3×3 Array{Int64,2}:
 1   5    3
 0   4    9
 2  10  102

massive2 = [
    0 11 0 
    0 10 5
    0 0 1
]
sort2!(massive2)

3×3 Array{Int64,2}:
 11  0  0
 10  5  0
  0  1  0

massive
        
3×3 Array{Int64,2}:
 1    3   5
 0    9   4
 2  102  10
        
massive2

3×3 Array{Int64,2}:
 0  11  0
 0  10  5
 0   0  1
