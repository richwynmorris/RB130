## Study Guide Part One - Blocks


### Contents

* Closures and scope
* How blocks work, and when we want to use them.
* Blocks and variable scope
* Write methods that use blocks and procs
* Methods with an explicit block parameter
* Arguments and return values with blocks
* When can you pass a block to a method
* &:symbol

### Closures and Scope

#### What is a closure?

A closure is a 'chunk of code' that can be saved to be executed at a later time. They create an 'enclosure' and in which they bind to the surrounding artifacts (e.g. local variables, methods, objects etc) in order to perform their operations when invoked. Closures bind to objects in the scope in which they are defined. 

#### What is a good way to think about closures?

A way to imagine how closures operate is as though they are methods without a name or the `def` and `end` reserved words.

###

#### What are the three different closures that we've studied in the course?

`blocks`, `procs` and `lambdas`.

#### What is a block? 

A block is an implicit arguments that is passed to a method. All methods take blocks but it is up to the method implementation as to whether the block is either ignored or executed. 

```ruby
# block is passed in but ignored.

1.odd? { puts 'hello' }

# => true

# block is executed as a result of the method implementation:

1.upto(3) do |num|
	puts num
end

1
2
3
#=> #<Enumerator: 1:upto(3)>

```

The syntax used for a block is either a `do`..`end` block or `{}`

#### When are blocks passed to methods? 

Blocks are passed to a method at method invocation time, meaning they are only passed to the method when the method is invoked.

#### How can we make sure a method executes a block in the method implmentation?

To ensure a block, that is passed into a method, is executed we use the reserved keyword `yield`. 

`yield` invokes the block and executes it at the method invocation time. 

```ruby
def hello
	yield
	'hello'
end

hello { puts 'hi' }
# 'hi'
# => 'hello' 
```

#### What happens if you don't pass a block to a method that contains `yield` in its implementation? 

Ruby will return a LocalJumpError as the method is expecting a block to be passed in.

```ruby
def hello
	yield
	'hello'
end

hello
# LocalJumpError: no block given (yield)
```

### What if the block passed to a method is optional? How can invoke it if there isn't always one that is passed into the method?

We can use the method #block_given? which will invoke `yield` if there is a block present.

```ruby
def hello
	yield if block_given?
	'hello'
end

hello { puts 'hi' }
# 'hi'
# => 'hello' 

hello
# => 'hello' 
```


#### Can `yield` accept arguments? 

Yes, you can you can pass an argument to a block using yield. This means the block parameters will point to the value that is passed to the block.

#### Does it matter if you're passing in the wrong number of arguments if you pass in the correct number of blocks?

Yes it does. Methods will always require the correct number of arguments. It will return the exception `ArgumentError` if it does not fulfil the method's requirements.

#### What happens if you block parameter has the same name as a local variable in the outerscope? 

Variable shadowing will take place and it will be impossible for the local variable in outerscope to be accessed. 

#### Does it matter if you have the correct number of block parameters for arguments, or arguments for parameters when it comes to blocks?

No, blocks have less demanding requirements when it comes to equality between the correct number of arguments and parameters. A block with a redundant parameter will simply point to nil and any additional arguments, that are not equal to the correct number of parameters, will be ignored. This is not the same for `lambdas`. These are called **arity** rules. 

#### Blocks and return values

Every block returns a value which the last evaluated expression in the block. This means blocks can be used to perform additional operations within a method. 

#### What are the two reasons for using blocks with methods? 

1) We're able to defer some of the method implementation to the method invocation thereby achieving a method with greater flexibility and general use. This also allows us to more highly refine the method at method invocation time. 

2) To perform sandwich code whereby we perform one operation within the method, execute the block and then perform a 'after' operation using the return value of the block. 
A good case example for this would be something like:

```ruby

def read_my_file
	my_file = File.open('my_file.txt') # => Before: open the file
	yield(my_file)
	my_file.close # => After: close the file
end

read_my_file { |file| file.read.split(' ').count }
```

### Methods with an explicit block parameter:

#### How do you pass a block around within the scope of a method without using the yield keyword?

You pass in a block to a method explicitly by prepending the method argument with an `&`. This converts the block to a simple `proc` object which can be passed around as an object. This means we can pass the the block to another method using a handle or invoke it using the `.call` method. 

```ruby
def hello(arg)
	arg.call
end

def say_something(&block)
	hello(block)
end

say_something { puts 'hello' } 
# 'hello'

```
NOTE:

When using the ampersand, you can use it convert a block to a proc but also a proc to a block. 

```ruby
proc_object = proc { puts 'hello' } # OR Proc.new { puts 'hello' }

def yield_method
	yield
end

yield_method(&proc_object)
# => 'hello'
```

## Blocks and Variable Scope

Blocks use their surrounding context in order to perform and execute. In essence, blocks carry thier universe around with them. This means that whenever they are executed, they use their own universe to perform the operation.


#### Red universe & Blue universe

```ruby
universe = 'red'

def what_universe(&another_universe)
  universe = 'blue'
  another_universe.call
  puts "The universe is #{universe}"
end

what_universe { puts "The universe is #{universe}"}

# => The universe is red
# => The universe is blue

```

Moreover, if the artifacts in the blocks scope are changed, the block parameter will also acknowledge this change and point to the most recent data the local variable is poitnting too. This further consolidates our theory that blocks are only passed to the method at method invocation time.

```ruby
universe = 'red'

def what_universe(&another_universe)
  universe = 'blue'
  another_universe.call
  puts "The universe is #{universe}"
end

universe = 'green'

what_universe { puts "The universe is #{universe}"}

# => The universe is green
# => The universe is blue

```

## &:symbol

Symbol#to_proc is used when we want to pass a block, that is defined as method, to another method. 

To do this we use the `&` operator prepended to a Symbol and then finally a method definition name. 

Firstly, the `&` operator takes the method and trys to convert it to a block. As it is not a block, ruby calls `to_proc` on the object. As the object is a symbol, it has it's own `Symbol#to_proc` method. The method body is then converted to a `proc` object and the `proc` object is then sent to the explict parameter which transforms it into a block. 

```ruby
[1,2,3,4].map(&:to_s)
# => ['1','2','3','4']
```