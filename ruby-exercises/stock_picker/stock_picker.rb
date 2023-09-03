def stock_picker(stocks)
  profit = 0
  result = [-1, -1]

  stocks.each_index do |i|
    stocks.each_index do |j|
      if j > i
        if stocks[j] - stocks[i] > profit
          profit = stocks[j] - stocks[i]
          result = [i, j]
        end
      end
    end
  end

  result
end

p stock_picker([17,3,6,9,15,8,6,1,10])
# should return [1, 4]