## Closures

### What are closures?

Closures are a programming concept that allow you to save a 'chunk of code' to use and execute at a later time. 

It is called an closure at it 'encloses' surrounding artifacts and binds them together. This allows the closure to be used at a later date. 

You can think of it as a method that can be passed around the program and used but is not defined using method definition syntax of `def` and `end` or given an explicit name. 

There are three main ways to create a closure: 

* Instantiating an object from a `Proc` class.
* Using `lambdas`
* Using `blocks` 

## Passing in blocks to methods

Methods do not automatically accept blocks as arguments. Instead we have to use the explicit reserved word yield to execute the block that is being passed in.

```ruby
def introduction
  yield
  1234
end

p introduction { puts 'Hello there, my name is Richard' }  # OUTPUT: 'Hello there, my name is Richard'
														   # => RETURN VALUE: 1234
```

The method must have the correct number of arguments passed to it regardless of whether yield is used or the block is passed in as an argument.

```ruby
def introduction(str)
  yield
  str
end

p introduction { puts 'Hello there, my name is Richard' } # => ARGUEMENTERROR: WRONG NUMBER OF ARGUMENTS
```

#### `Yield` allows a developer to add functionality to an existing method without modifying the definition.

If you include the `yield` keyword in the method definition and do not pass in a block, Ruby will throw a `LocalJumpError`. This indicates to us that the method includes `yield` but has not had a block passed to it.

```ruby
def introduction(str)
  yield
  str
end

p introduction('hello') # => LocalJumpError: no block given (yield)
```

To make a passing a block into a method optional, we can include the conditional method `Kernel#block_given?`. 

As this is method is from the `Kernel` module and mixedin to the `Object` class, its available to all objects. 

From a practical standpoint, this means we're able to call the method both with, and without, a block.

```ruby
# No block given
def introduction(str)
  yield if block_given? 
  str
end

p introduction('hello') # => "hello"

# Block given
def introduction(str)
  yield if block_given? 
  str
end

p introduction('hello') { puts "Print if passed in to the method" } # "Print if passed in to the method"
                                                                    # => "hello"
```

## Arity Rules With Blocks

### What happens if you pass in the wrong number of arguments to a block?

```ruby
def test_method # Method Implementation
	yield(1,2)
end

test_method { |number| puts number } # Method Invocation

# Prints => 1
```

If you pass in the wrong number of block arguements, that arguments are ignored by the block parameter. 

### What happens if you add more block parameters than there are arguments? 

```ruby
def test_method # Method Implementation
  yield(1)
end

test_method { |number1, number2| puts "#{number1} #{number2}" } # Method Invocation

# Prints => 1 
```

If you add additional block parameters to a block, Ruby will assign `nil` to the additional parameter which will be interpolated as ane empty space within a string. 


KEY POINT: blocks don't enforce argument count unlike traditional methods.  

## The Return Value of Yield

A block will always produce a return value, which is the last evaluated expression in the block.

This value can be assigned to a local variable contained within a method:

```ruby
def change_a_string(str)
  puts "Original String: #{str}"
  new_str = yield(str)
  puts "Modified String: #{new_str}"
end

change_a_string('Hello'){ |str| str.upcase } 

# => Original String: Hello
#    Modified String: HELLO
```

## When to use blocks with your own methods

The first case use, is that by using blocks with our methods, we can make our methods perform the general operation we want to take place but give us greater flexibility in how the method implementation is used. This gives us the ability to more highly refine how a method's operation is performed.

Mental Model:

Think of the `#select` method; the general case use is to select the values that return `true` when evaluated. The block allows us to more highly define, what should be considered `true`. 



