### Notion: Lesson 2 Revision notes

https://www.notion.so/RB139-Lesson-2-Testing-c887351ccb374bd99167d2c809cb0703

### What is regression / unit testing?

Regression/ unit testing is testing specific functions of source code when the source code has been modified in some way. This means we don't need run the application in its entirety and we can focus on testing only the specific parts of the source code we have changed. 

### What is an assertion?

An assertion is the verfication step whereby we check whether a method's return value is the same as our expected value. A test can have multiple assertions. 

### What is a test?

A test referst to the situation or context in which tests are run. For example, to see if a function is operating as intended. Tests contain multiple assertions. 

### What is a test suite? 

A test suite is all the individual tests that accompany a program. A test suite can contain multiple tests. 

### Why do we write tests? 

We write tests to check if functions are operating as a expected and to prevent regression in our source code.

### What is the defualt testing library that comes with Ruby?

Minitest is the default testing library and can be installed through the use of the Minitest gem. 

### What is a DSL? Which popular DSL do people often use to write testing code? What is the downside of this DSL?

A DSL is a domain specific lanuage which means it is only used in a specific context. RSpec uses a DSL which operates similarly Ruby. People use RSpec because it creates more readable test. However, the downside to this is it's a more complicated syntax to use. Minitest, however, be used just using Ruby syntax. 

### Look at the test file below and break down what is happening line by line. 

```ruby
require 'minitest/autorun'

require_relative 'car'

class CarTest < MiniTest::Test
  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end
end
```

On line 36, we require the Minitest gam using the `require` keyword. This gives us access to the modules that are contained within the gem. 

On line 38, we require the related source code using the `require_relative` keyword. This makes the source code in our current directory accessible to our test file and means we can test for functionality and instantiate the required objects in our test class. 

On lines 40 - 45, we define a test class called `CarTest` which inherits from the `Minitest` module and give the class access to behvaiours it needs to carry out the test.

On lines, 41 - 44, we define a test instance method using the `test_` method name. This indicates to ruby that this test should be executed when a test is run.

On line 42, we initialize a local variable called `car` and assign it to new instantiated class instance from the `Car` class.

On line 43, we call the instance method `assert_equal` which is inherited instance method from the `Minitest` module. This will then check whether the left hand arguement, our expected value, is equal to the return value of the instance method `wheels` on when invoked on the `car` object. If both values are equal to one another, the test will not fail. 

### How do you prefix an instance method within a test class to let Minitest know which method needs to be run?

You need to use the correct syntax in the method name which is `test_`.

#### What do you have to do before you make an assertion?

You need to ensure that the test class has inherited from `Minitest::test` so that we have access to the assertion instance methods. 

#### How many parameters does assert_equal take, and what happens if there's a discrepancy?

`assert_equal` takes two parameters, the first is the expected value and the second is the return value of the method you are testing. If they do not equate to one another, the test fails. 

#### In the default Minitest format, what does the first "seed" tell Minitest? Why is it used?

The seed tells us the order in which the tests are run. Minitest will run the tests in a random order as its default setting. If we want to run the tests in a specific order, we can use the seed to do this. However, this is advised by the Minitest developers. 

#### After the seed, what does the dot mean? "S"?   "F"?

 `.` indicates to us that a test has passed. `S` indicates a test was skipped and `F` indicates to the that a test has failed. 


#### When the test fails, where does it indicate that it has done so? Identify at least three parts, and explain what is happening in each part.

The first failure will be indicated underneath the seed line, This will be shown as the letter `F`

Underneath that,  we have the next reference to the failure which will tell you which test specifically failed and why it failed.

Finally on the last line, you recieve a summary of all the failed tests from the test suite. 

#### How do you add color to the output?

install the ruby gem `minitest-reporters` and require the `minitest-reporters` gem in your test file. 

#### How do you skip a test?

You use the reserved word `skip` underneath the test instance method name. This test will then be skipped once the test is executed. This will be shown in the minitest reporter as 'S'. 

#### What is the difference between the assertion or assert-style syntax and the expectation or spec-style syntax?

Expectation or spec-style syntax uses different reserved words. First of all, it uses the reserved for `describe` in which the test description is writtten. 

Secondly. the expectation syntac uses the method it which is used to run tests. Within the block the instance method being tested has the method
`must_equal` called on it and the expected value is passed in. This means we no longer use assertion methods but instead use expectation methods. 

#### What are Minitest and RSpec used for?

Minitest and RSpec are borth examples of Ruby frameworks and are used to test source code to prevent regression. 

#### How are Minitest and Rspec different? 

Rspec uses a doman specific langauge with is based on Ruby but is not conventional ruby syntax. Minitest, however, uses ruby syntax as standard. 

#### Provide an example of using expectation (spec-style) testing syntax.

```ruby
require 'minitest/autorun'

require_relative 'car'

describe "Testing Car#wheels method" do
	it "car has 4 wheels" do
		car = Car.new
		car.wheels.must_equal 4
	end
end
```

#### What does SEAT stand for?

SEAT stands for:

Setup - stands for setting up class objects and instance variables to be used by the instance test methods.
Execute tests against test objects
Assertions are verfied through the execution of the tests.
Teardown - stands for cleaning up any of files or data being used in the tests.

### What is the purpose of the setup method?

The purpose of the setup method is to set up instance variables that are instantiated from the class that is being tested. These instance variables can then be used by the instance test methods in the testing suite. The setup method is run before any tests are executed.  


