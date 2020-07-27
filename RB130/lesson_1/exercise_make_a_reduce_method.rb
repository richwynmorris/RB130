def reduce(array, acc=0)
  index = 0
  
  while index < array.length
    acc = yield(acc, array[index])
    index += 1
  end
  
  acc
end
  
array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass



def reduce(array, acc=array[0])
  index = 1
  
  while index < array.length
    acc = yield(acc, array[index])
    index += 1      
  end
  
  acc
end
  
p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']