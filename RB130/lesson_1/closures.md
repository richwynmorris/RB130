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

#### `Yield` allows a developer to come in and add functionality to an existing method defintion without modifying the code directly 

If you include the `yield` keyword in the method definition and do not pass in a block, Ruby will throw a `LocalJumpError`. This indicates to us that the method includes `yield` but has not has a block passed to it.

```ruby
def introduction(str)
  yield
  str
end

p introduction('hello') # => LocalJumpError: no block given (yield)
```

To make a passing a block into a method optional, we can include the conditional method `Kernel#block_given?`. 

As this is method from the `Kernel` module and mixedin to the `Object` class, its available to all objects. 

From a practical standpoint, this means we're able to call the method both with and without a block.

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

