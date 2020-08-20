```ruby
# method implementation
def times(number)
  counter = 0
  while counter < number do
    yield(counter)
    counter += 1
  end

  number
end

# method invocation
times(5) do |num|
  puts num
end
```

## Trace the code execution flow of the code above.

On line 13 the times method is invoked and the integer 5 is passed to it as an argument. Moreover, a block is implicitly passed to the method using the `do`..`end` delimiters.

Ruby now moves to the method definition at lines 2 - 10. The parameter `number` now references the argument passed to the method which is the integer `5`.

On line 3, a local variable counter is initialized and assigned the Integer `0`.

On lines 4 - 7 a while loop method is included with a break condition being execute if the counter is equal to or higher than the number. a block is passed to this method implicitly. 
As the counter is set at 0, the while loop method is executed. The `yield` keyword is included and the counter is passed as an argument to the block on lines 13 - 15. 

Ruby now moves back to lines 13 - 15 and the block parameter `num` now points to the argument that has been passed in which is the integer `0`. `0` is then passed to the `puts` method on 
line 14 and the Integer is converted to a string and output to the terminal. The puts method then returns nil.

We then return to line 6 where the local variable `counter` is incremented by 1 using the `+=` method.

The while loop repeats the same process, passing the newly incremented counter value to the block on lines 13 - 15 each time until the while expression returns false and breaks.

This outputs:
```ruby
0
#=> nil
1
#=> nil
2
#=> nil
3
#=> nil
4
#=> nil
```

The last expression within the `times` method definition is `number` which is stated on line 10. This returns the value `number` references which is `5`. Making the return value of the method `5`


## Trace the code execution in the custom #each method below, and explain the return value of the code in line 12. What principle does this demonstrate about writing generic iterating methods?

```ruby
def each(array)
  counter = 0

  while counter < array.size
    yield(array[counter])
    counter += 1
  end

  array
end

each([1, 2, 3, 4, 5]) {|num| "do nothing"}.select{ |num| num.odd? }
```

On line 68, the `each` method is called and array object, containing 5 Integers, is passed to the method as an arguments. Moreover, a block is passed implicitly as an argument to the method. 

Ruby then moves tot he method defintition on line 57 and assigns the method parameter `array` to the array object that is passed in as an argument.

On line 58,  a local variable counter is initialized and assigned the integer '0'.

On line 60 - 63, a while loop method is invoked with a break condition if the counter is equal to, or greater than, the array.size is it should return false and break. 

On line 61, the reseved key word `yield` is stated and the array object referencing the value at index `0`, which returns `1` is passed in. 

Ruby now moves to line 68, and the block parameter `num` now points to the argument we passed in which is `1`.  The block returns the last evaluated expression which is the string object "do nothing".

Ruby not moves back to the method definition on line 62 and increments the local variable `counter` with by '1' using the `+=` method.

The process is repreated, using the newly incremented `counter` variable to change the index position, until the `while` statement returns false and the loop breaks. This returns "do nothing" 4 times.

The last expression in the method `array` which references our oringinal array object is returned.

This array object, which is returned by the `each` method is the object which the `select` method, on line 68, uses to iterate over the values. The block is passed to the select method which returns a new array object with the values that are odd. These are `[1,3,5]`. This is then returned by the select method.


```ruby
def exclaim(array, &block) 
  value = '!'
  array.map(&block) 
  block.call(array).map! {|object| object = value} 
end

value = '!!!'

exclaim(["hi", "bye"]) { |n| n << value }

value = '!!'
```