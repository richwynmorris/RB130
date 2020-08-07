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

To do this we use the `&` operator prepended to a Symbol and then finally a method definition name. asweeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeed

Firstly, the `&` operator takes the method and trys to convert it to a block. As it is not a block, ruby calls `to_proc` on the object. As the object is a symbol, it has it's own `Symbol#to_proc` method. The method body is then converted to a `proc` object and the `proc` object is then sent to the explict parameter which transforms it into a block. 

```ruby
[1,2,3,4].map(&:to_s)
# => ['1','2','3','4']
```

```ruby
[1, 2, 3].each do |num|
	puts num
end
```

#### Describe in detail what is happening in the code above. What is the do..end block in relation to the Array#each method?

On line 1, we have an aray object containing these integers. We have an invoked `each` method which has been called by the object. On lines 1 - 3, we have a `do`..`end` block which is passed implicitly to the method. The block contains a block parameter called `num`, `num` points to each object as the `each` method iterates through the array. The block provides additional flexibility for the `each` method. The block is executed and the value the block parameter is pointing at is passed to the `puts` method and the value is output and the return value is nil. At the end of iteration `each` returns the original calling object `[1,2,3]`.


#### Why does a block sometimes affect the return value of a method and sometimes not?

A block will sometimes affect the return value of a method as the block itself returns a value, which is the last executed expression in a block. This means the block may mutate of alter a variable's value which the method in turn may use in its opertation. 

#### What is the difference between passing in a block to a method and passing in an argument?

All methods can implicitly accept a block that is passed to it. It is up to the method implementation as to how the block is used. However, a method, if it explicitly requires an argument, through the use of a parameter, MUST be passsed in. If not, ruby will return an invalid argument errror. 

#### How can you make sure that a method has access to a block? 

You can pass the block to the method explicitly by prepending the '&' operator the the method parameter. When the block is then passed to the method, the block is converted to a simple `proc` object which then the method parameter points to. The proc object can then be executed using the `#call` method. Moreover, we can use a the handle to pass it another method or execute the block again at another time. 

#### What does it mean when we see a LocalJumpError? 

When you see a LocalJumpError, it indicates to us that the method that has been invoked contains the `yield` keyword. This means that the method must have a block passed to it for it to be executed. 

```ruby
def say(words)
  yield if block_given?
  puts "> " + words
end

say("hi there") do
  system 'clear'
end
```

#### In the code above, which part is the method invocation and which part is the method implementation? Why is this important to distinguish?

Lines 267 - 270 are the method implementation. This means that these lines define, and execute, the operations for the method. On lines 272, we see the method invocation and the block which is passed implicitly as an argument to the method. This block allows the method implementation to be partly defered to the time of method invocation. As the block is then invoked by the method implementation, using the keyword `yield` on line 268. 

#### What is a block parameter? A block local variable? 

A block parameter is the the name of the object between the two pipes ||. The block local variable is where the same name is used within the block. This block local variable is constained to the scope of the block. 


#### What is arity?
Arity rules are the requirements for an object to function in relation to the correct number of arguments and parameters. Methods have string arity rules in relation to the correct number of arguments and parameters that the method contains. Blocks however are more flexible and will accept any number arguments you pass to it. Moreover, you do not need to fulfil the parameter requirements for the block either. It will simply set the value of any non initialized parameters to nil. 

#### Can blocks mutate the argument?

Yes they can, just like methods. Blocks will return the last evaluated expression within them so if they mutate the argument, this means the return value with a mutated result.

#### What are the two roles involved with any method?
To either mutate an argument or return a value. 

#### Name two areas where before/after actions are important.

* Time loging - Timing when something began and when it ended.
* Resource Management - Opening and closing files to prevent memory leaks. 

#### "Every method, regardless of its definition, takes an _______ ________."

*Implicit block* 

#### Why do we use #call instead of #yield to invoke a Proc object?

We use call, as `#call` is a proc method, where as yield can only be used with an implicit block that is passed to the method. 

#### Why is it useful to write a generic iterating method?

It's useful to write a generic iterating method because we can specify exactly what we would like the implementation to be at the time of method invocation using a block. If we were to specify the use of the method exactly, we would have to write it in the method definition thereby limiting the functionality of the method. If we are able to defer the refinement to the time of invocation, we can use the method for the specific situation. This also indirectly allows us to achieve the DRY principle as we don't have to generate specific methods for each case. 

#### What is an accumulator object?

An accumulator object exists to to capture the return value of the block and assigns itself to it. 

```ruby
[1,2,3,4].reduce do |acc, num|
	acc + num 
end
```

#### Why build a custom collection class? Name at least 3 reasons.

1) We can add additional attributes to the collection.
2) We can provide additional behaviours for our class. 
3) We can enforce requirements as to what should be contained with the collection. 

#### Why is it preferred to implement a custom iterator? Name at least 3 reasons.
1) We can deal with specific attributes that an instance of class might have.
2) We're only dealing directly with the class public interface and not data from the class. (Encapsulation)
3) If we change the object data that we're dealing with, within the instance itself, we have to change the method 
implementation. However, if we define our own custom iterator that iterates over a specific class, it no longer matters
if we need to change how the data is being used within the class. 

#### Why is it important to use the class's interface when possible? 

It is important to use a class' interface where possible as we only want to deal with the object itself, not data and states contained within the object. This achieves encapsulation and means we can contain any rippling effects that might be produced by altering the object's state. 

#### Why is it important to be aware if something is a method or a local variable?

It's important to be aware as they may look similar in our code. Methods can be called from anywhere, however, local variables have a specific scope and can only be accessed at the scope they were intialzed at. To find out whether something is either a method or a local variable, always look for the scope it is initialized at. 

#### Why would we use a closure instead of defining a method?

We can use a closure instead a method as it provides us with additional flexibility. We can also pass a closure to a method to defer some implmentation to the time of method invocation. We can do this either implicitly of explicitly. 

#### What is a binding in reference to a closure?

A binding is how a closure uses the scope it is initialized in to make reference to its surrounding artifacts be them local variables, objects methods etc. This is like the surrounding context or universe of the block. 


#### Provide example code the illustrates the relationship between blocks and return values.

```ruby

def sing
	puts yield
end

sing do 
	"Jingle bells"
	"Batman smells"
end

# => "Batman smells"
```


#### Explain what happens when &:a_symbol is passed as an argument to a method.

When &:a_symbol is passed to a method, ruby first tries to convert the object from a block to a proc, if it cannot do this. It calls the Symbol#to_proc method. This then converts the block contained within the method which the symbol is referencing into a block object, The `&` ampersand then converts the block object in a project object. If it cannot convert the block to a proc it throws an error. 

 



