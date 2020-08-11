
### What is a project?

A project is a collections of files that are stored together that are used to build, develop, test and distribute software. 

This could be in the form of an exectionable program, a library module, or a combination of the two.

In ruby, we use the rubygem standard patterns to organise our programs. In our main directory, we have two other keys subdirectories, `lib` which is the directory that contains our source code and `test` which contains the test suite that is accommpanys the main program. 

### What do you get when you install Ruby?

When you install Ruby you get the core library, standard library, irb REPL, the rake utility, the gem command and documentation. 

### What are Rubygems? Give some examples of Rubygems. 

Rubygems are packages of code that you can download, install and add to your programs or run from the command line. The `gem` command allows you to manage your gems. Examples of some Rubygems would Pry, Minitest and Rubocop. Gems are stored in remote libraries which you can access using the command `gem install`. 

### How do you find out more information about a particular Gem in your local library system?

You can use the command `gem env` which will output the installation information regarding the gems location on your local system. 

### What is a Ruby version manager?

A ruby version managers are programs that allow you to install, manage and use multiple versions of ruby on your computer. Ruby version managers allow us to work with legacy code that may use an older version of Ruby that may contain different features than the most up to date version of Ruby. Therefore we can use a Ruby version manager to easily switch the version of Ruby that we're using to interact with older code. 

### How are gems affected by ruby version managers?

Each installation of Ruby allows us access to multiple versions of gems which will only be compatiable with a specific version of Ruby. We can use a ruby version manager to make those gems accessible for the program to operate correctly. You can multiple versions of gems installed on one Ruby installation. 

### What are the two different ruby version managers? 

The two most common ruby managers are RVM and Rbenv. The differences between the two are as follows: 

RVM:
*RVM is more dynamic as it modifies the environment, by modifying the `PATH` variable, so that various ruby commands invoke the correct version.

*It replaces the `cd` command for its own RVM shell that will modify the environment dependent on the directory accessed. 

Rbenv:
* Uses small scripts called `shims`. These are included in the PATH directory and are always searched first before the any other ruby directories. 

* Shims check which version of ruby is required and executes the request using the correct ruby version. 

### What is Bundler?

Bundler is a dependecy manager which allows us to manage and implement the various versions of ruby gems that are required in order for a program to operate. An app that requires bundler should add `require 'bundler/setup'` at the top of the ruby file so that the PATH loads the correct dependcies as specified in the Gemfile.lock.  Bundler interacts with the `Gemfile` in order to configure the correct dependencies for the program. Bundler allows us to easily distribute our own programs on other systems.  

### What is a gemfile? 

A gemfile is the file that bundler interacts and searches for the correct dependencies. It allows us to configure the correct versions of the ruby gems that are needed for a program to function correctly. It will contain information on where to find the gem, if it needs a .gemspec file and add the relevent Gems required. 

### Explain how to set up a Gemfile. 

First we create a Gemfile and add the relevent library and source for the Gems. 

Gemfile uses a DSL that allows us to reference the gem and particular version we want installed in the program. 

We can reference the version that we would like used using the `ruby` keyword and adding the version to it afterwards.

To add a gem we simply use the `gem` keyword followed by the gem name that we want included. You can reference a specific version using the `~>` syntax.

We then call the command `bundler install` in the terminal, it reads the `Gemfile` and adds the required dependencies. It then produces the `Gemfile.lock` file which contains all the dependecy information for your app and any other additional dependency information that was downloaded as a result. If you change the Gemfile, you will need to rerun the `bundle install` command again. 


We can use `bundle exec` to resolve any dependency conflicts when issuing commands. This usually occurs when you use a Gem command that different from the version required in the `Gemfile`. 









