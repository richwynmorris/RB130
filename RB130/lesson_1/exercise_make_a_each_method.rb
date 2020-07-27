def each(array)
  index = 0
  while index < array.size
    yield(array[index])
    index += 1
  end
  array
end
p each([1,2,3,4]) { |num| puts num + 1 }