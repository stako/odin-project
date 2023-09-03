def fibs(length)
  return [0] if length < 2

  arr = [0, 1]
  arr << arr[-1] + arr[-2] while arr.length < length
  arr
end

def fibs_rec(length)
  return [0] if length < 2

  arr = fibs_rec(length - 1)
  arr << arr[-1] + (arr[-2] or 1)
end

puts "fibs(8):     #{fibs(8)}"
puts "fibs_rec(8): #{fibs_rec(8)}"
