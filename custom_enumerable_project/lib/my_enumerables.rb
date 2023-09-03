module Enumerable
  def my_each_with_index
    i = 0
    while i < size
      yield(self[i], i)
      i += 1
    end

    self
  end

  def my_select
    arr = []
    each { |i| arr.push(i) if yield(i) }
    arr
  end

  def my_all?
    each { |i| return false unless yield(i) }
    true
  end

  def my_any?
    each { |i| return true if yield(i) }
    false
  end

  def my_none?
    each { |i| return false if yield(i) }
    true
  end

  def my_count
    return size unless block_given?

    count = 0
    each { |i| count += 1 if yield(i) }
    count
  end

  def my_map
    arr = []
    each { |i| arr.push(yield(i)) }
    arr
  end

  def my_inject(accumulator)
    each { |i| accumulator = yield(accumulator, i) }
    accumulator
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for i in self do
      yield(i)
    end
  end
end
