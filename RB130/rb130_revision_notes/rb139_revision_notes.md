## What is a closure? 

A closure is a "chuck of code" that can be passed around and executed. You can imagine it in the same way as a method but defined without an explicit name. A closure will use the scope context with which it is initialized to to bind to it's surrounding artifacts (e.g. variables, methods, objects) in order to perform it's operation. 

## What is a good way to think about closures? 
Think of them like methods but without an explicit name to reference. 

## What are the three different closures we've studied?

* Procs
* Lambdas
* Blocks

## What is a block? 
A block is type of closure. All methods take a block implicitly. However, it is up to the method to decide whether the block should be executed or ignored. A block allows us to defer some of the method implementation to the point of method invocation. Blocks give us greater flexibility in terms of how we use our methods. 

Blocks can be defined either using `do` and `end` or `{}`.

## When are blocks passed to methods?
Blocks are always passed to method implicitly at the point of method invocation. All methods take blocks. However, it is up to the method to decide what is done with the block.

## How can we make sure a method executes a block in the method implementation?

To make sure a block is executed, we need to include the reserved keyword `yield` in our method definition. This means when the method is executed, the block will be invoked. 

## What happens if you don't pass a block to a method that contains yield in its implementation?

If you don't pass a block to a method that contains `yield`, Ruby will return a `LocalJumpError`. You must pass a block to the method if the method contains `yield`.

## What if the block passed to a method is optional? How can we invoke it if there isn't always one that is passed into the method?

We can use the method `#block_given?` in combination with a conditional statement and `yield` so that we can invoke the block if the block is present and have a different operation to be exectued if the block is not present. 

## Can yield accept arguments?

Yes, `yield` can accept arguments. The arguement that is passed to the yield keyword will be the same value that the block parameter will point to within the block. 

## Does it matter if you're passing in the wrong number of arguments to a method?
Yes it does. Methods will always require the correct number of arguments. It will return the exception ArgumentError if it does not fulfill the method's requirements.

## What happens if the block parameter has the same name as a local variable in the outer scope?

This causes variable shadowing as the block parameter essentially blocks access to the local variable defined in the outerscope as they are defined with the same name. Any variable that initialized within the scope of a block is scoped at the block level, which means ruby will not be able to reference the variable in the outerscope. 

## Does it matter if you have the correct number of block parameters for arguments, or arguments for parameters when it comes to blocks?

No, blocks have specific arity rules which means they are less strict in terms of what they will accept in relation to available blocks and correct number of arguments. This means if the number of arguments are fewer than the number of parameters, the parameter will simply point to nil. If there are more arguments than there are parameters, the additional arguements will be ignored. 


## Explain blocks and their return values

Blocks will always return a value which is the last evaluated expression in the block. As a result, after the operation has been performed within the block, the block can perform an additional function within the method. 

## What are the two reasons for using blocks with methods?

The two reasons for using blocks with methods are to:

* Defer method implementation to the time of method invocation. This means we're able to grant further flexibility for our method to be used at different times and for different purposes. 

* To perform 'Sandwich Code'. This is where we perform an operation before executing the block, executing the block itself and then perform an operation after the block has been executed. We use the approach for example when opening and closing files to prevent memory leaks or , for example, timing operations. 


## How do you pass a block around within the scope of a method without using the yield keyword?

You can pass a block around the scope of a method by passing it in explicitly. We do this by prepending the method parameter with `&`. This converts the block to a simple proc object which can be passed to another method as an arguement or be invoked using the `#call` method. 

```ruby

def my_method(&block)
	2 + 2
	block.call
end

my_method { puts '5' }
# 5
# => nil 
``` 

## Explain the concept of blocks and variable scope

Blocks carry the context at which they are initialized with around with them, binding to the surrounding artifacts so they can be made reference to in the blocks execution. This means a block will always reference to the context it was initialized in, even if it is being invoked from within a method. Moreover, any local variable that are defined at the block scope level will not be avaiable in outerscope. 


## What is &:symbol?

The use of `&:symbol` is shorthand syntax to pass a method block to a method to perform an operation. First of all, the `&` tries to convert the object it is refering to, to a block as it is expecting a proc object. As it is not a proc, and is instead a symbol, it instead calls the Symbol#to_proc method. This converts the method to a proc object. The `&` now converts the proc object back to a block object which is passed to the method implicitly when the method is executed. 


```ruby
[1, 2, 3].each do |num|
	puts num
end
```

## Describe in detail what is happening in the code above. What is the do..end block in relation to the Array#each method?

On line 90, we have an Array object that contains 3 integers, 1,2,3. 

Also on line 90, the Array object is calling the `#each` method.

On lines 90 - 92, a `do`..`end` block that is implicitly passed to the each method. 

The block parameter |num| points to each individual integer on each iteration. 

On line 91, the puts method is invoked and the integer that the `num` parameter is currently pointing to is passed to the method and printed. The `puts` method then returns `nil`. 

At the end of the `#each` method operation, the method returns the original array object.

## Why does a block sometimes affect the return value of a method and sometimes not?

Blocks have the ability to mutate the argument that is passed them which means the return value of the method maybe altered as a result. Blocks always return the last evaluated expression within them. This maybe assigned to a local variable contained within the method and, as a result, may alter the original argument.

## What is the difference between passing in a block to a method and passing in an argument?

Methods will always accept a block implicitly. However, when a a method required an argument, that arguement must be explcitily given otherwise Ruby will raise a `ArgumentError` message. 

```ruby
def say(words)
  yield if block_given?
  puts "> " + words
end

say("hi there") do
  system 'clear'
end
```

## In the code above, which part is the method invocation and which part is the method implementation? Why is this important to distinguish?

On line 123, the method `say` is invoked and the string object `"hi there"` is passed in as an argument. This is the method invocation.

Ruby then moves to the method definition to invoke the method `say`, `say` has one parameter `words` which points to the string object `'hello there'`

on line 119, the keyword `yield` is included followed by the coniditional `if` expression and the `#block_given?` method. As the `#block_given?` returns true as it detects the block is implicitly passed to the method `say` the `yield` keyword is invoked. 

Ruby now moves to line 123 - 125 to exectue the block, which invoked the `system` method and clear's the display on the terminal. After the block has been executed, Ruby moves back to the `say` method and executes the line on 120. This concatenates the string object `>` with the parameter `words`, which is referencing the string object `hi there`, using the `+` method. The return value of the `+` method is then passed to the puts methods and printed to the screen and as the `puts` method retursn nil, and it is the ;ast evalauted expression in the `say` method the `say` method also returns `nil`. 

The method invocation is line 123 and the method implementation is lines 118 - 121. Blocks allow part of the method implementation to left until the time of method invocation. 

## What is a block parameter? A block local variable?

A block parameter is defined within a block using the double pipe syntax `||`. The block parameter will reference any arguement that is passed to the block. A block local variable is a local variable that is defined at the block level. This cannot be accessed from outside the block. 

## What is arity?

Arity dictates the strictness requirements of objects in relation to their arguement to parameter ratio. Blocks have less strict arity compared to methods. 

## Name two areas where before/after actions are important.

* Time logging - Starting a time, performing an operation, and stoping the time. 
* Opening Files - Opening a file, performing an operation, and closing the file. (If the file remains open it creates memory leaks. )

## "Every method, regardless of its definition, takes an _______ ________."

Implicity block.

## Why do we use #call instead of #yield to invoke a Proc object?

Yield only works in relation to block objects. If the object passed is Proc object, the `yield` keyword will not invoke the object. 

`#call` is a Proc specific method which invokes block that the Proc object is referencing. 

## Why is it useful to write a generic iterating method?

It's useful to write a generic iterating method because we can defer part of the implementation for each iteration to an block that can be implicitly passed to the method as an argument. With this block we're able to dictate what happens upon each iteration. Without defering part of the implmenetation to the method invocation, we would need to define the methods operation in the method defintition itself. This would mean we would have to alter the method each time we used it or have to create multiple methods that perform is operation that we would require. 

## What is an accumulator object?

An accumulator object is a an object that points to the sum of a block. We can see an example of an acculator object being used in the `#inject` method. 

```ruby
[1,2,3,4].inject(0) {|accum, num| accum + num }
```

## Why build a custom collection class? Name at least 3 reasons.

1) We can create boundaries so that our custom collection class will only accept objects of a specific class.
2) We can change the data strucutre of the class without worrying about rippling effect throughout the program (encapuslation)
3) We can add additional attributes/behaviours to the class

## Why is it preferred to implement a custom iterator? Name at least 3 reasons.

1) To encourage the user to interact with the custom classes' method through public interface and not the state of the class itself. 
2) So that we're dealing with the class itself and not the data structure directly. If we're dealing with the data strcuture contained within the class, and this data structure is modified in some way, the iterator will not be able to interact with the class. 
3) We're able to create rules for iterator to only interact with objects of a specfic class. 


## Why is it important to be aware if something is a method or a local variable?

A method definition and local variable can look the same within the contect of a program. It's important to check the scope to detemine if it is a local variable or a method definition name. 

## Why would we use a closure instead of defining a method?

We would use a closure instead of defining a method as a closures can be passed around as a chunk of code that can be accessed and invoked from within any method by being passed in either explicitly or implicitly. This is give us greater flexibility to modify a methods implementation at the time of method invocation. 

## Provide example code the illustrates the relationship between blocks and return values.

```ruby
def info
	yield + 'four wheels'
end

info do 
	"The car has "
	"The motorbike has "
end
# "The motorbike has four wheels"
# => nil
```

The return value of the block will always be the last evaluated expression in this case it's "The motobike has".