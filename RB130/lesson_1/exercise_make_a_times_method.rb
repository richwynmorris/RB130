# Custom Times Method:

def times(num)
  counter = 0
  while counter < num
    yield(counter)
    counter += 1
  end
  num
end

p times(5) { |num| puts num }