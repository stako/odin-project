def merge_sort(arr)
  return arr if arr.size < 2

  half = arr.size / 2
  left = merge_sort(arr[0..half - 1])
  right = merge_sort(arr[half..])

  arr.clear

  until left.empty? || right.empty?
    arr << if left.first < right.first
      # Array#shift removes & returns the first element,
      # which is shovelled into arr
      left.shift
    else
      right.shift
    end
  end

  arr + left + right
end

arr = [32, 100, 56, 2, 89, 150, 12, 4]
p merge_sort(arr)
