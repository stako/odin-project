def substrings(string, dictionary)
  result = {}
  string.downcase!

  dictionary.each do |word|
    count = string.scan(word.downcase).length
    result[word] = count if count > 0
  end

  p result
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings("below", dictionary)
substrings("Howdy partner, sit down! How's it going?", dictionary)