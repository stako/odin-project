def bubble_sort(array)
  loops = 1

  loop do
    swap_made = false

    array.take(array.length - loops).each_index do |i|
      if array[i] > array[i+1]
        array[i], array[i+1] = array[i+1], array[i]
        swap_made = true
      end
    end

    loops += 1

    break unless swap_made
  end
  array
end

p bubble_sort([4,3,78,2,0,2])
# expected return: [0,2,2,3,4,78]