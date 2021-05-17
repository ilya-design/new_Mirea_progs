function sortkey!(key_values, a)
    size = length(key_values)
    for i in 1:size
        for j in 1:size
            if key_values[i] < key_values[j]
                key_values[i], key_values[j] = key_values[j], key_values[i]
                a[i], a[j] = a[j], a[i]
            end
        end
    end
    return a
end

sortkey! (generic function with 1 method)

massive = [1 5 7]
keys_ = [3 2 1]
sortkey!(keys_, massive)

1×3 Array{Int64,2}:
 7  5  1

massive

1×3 Array{Int64,2}:
 7  5  1
