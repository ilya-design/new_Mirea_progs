function calcsort(a, diap::NTuple{2, Int})
    left_border, right_border = diap
    nums_count = right_border - left_border + 1
    nums = zeros(Int, nums_count)
    for i in a
        nums[i - left_border + 1] += 1 
    end
    my_ans = []
    for i in 1:(right_border - left_border + 1)
        for j in 1:nums[i]
            push!(my_ans, i + left_border - 1)
        end
    end
    return my_ans 
end


function calcsort(a, diap::Vector{Int})
    nums = Dict{Int64, Int64}()
    for i in a
        nums[i]= get(nums, i, 0) + 1
    end
    my_ans = []
    for i in sort(collect(keys(nums)))
        to_push = [i for j in 1:nums[i]]
        push!(my_ans, to_push...)
    end
    return my_ans 
end

calcsort

massive = [3, 5, 5, 3, 4]
vals = (3,5)
calcsort(massive, vals)

5-element Array{Any,1}:
 3
 3
 4
 5
 5
Проверим для вектора значений:


massive = [5, 5, 5, 2, 1]
vals = [1, 2, 5]
calcsort(massive, vals)
