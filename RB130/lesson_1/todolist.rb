# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end


# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title, :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  # rest of class needs implementation

  def add(item)
    raise TypeError.new("Can only add Todo objects") unless item.is_a?(Todo)
    @todos << item
    self.todos
  end

  def size
    todos.size
  end
  
  def first
    todos.first
  end
  
  def last
    todos.last
  end
  
  def to_a
    todos.clone
  end
  
  def done?
    todos.all? { |todo| todo.done?}
  end
  
  def item_at(index)
    raise IndexError if (index + 1) > todos.length 
    todos[index]
  end
  
  def mark_done_at(index)
    raise IndexError if (index + 1) > todos.length 
    todos[index].done!
  end
  
  def mark_undone_at(index)
    raise IndexError if (index + 1) > todos.length 
    todos[index].undone!
  end
  
  def done!
    todos.each do |todo|
      todo.done!
    end
  end
  
  def shift
    todos.shift
  end
  
  def pop
    todos.pop
  end
  
  def remove_at(index)
    raise IndexError if (index + 1) > todos.length 
    todos.delete_at(index)
  end
  
  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end
  
  def each
    index = 0
    while index < @todos.length
      yield(@todos[index])
      index += 1
    end
    self
  end
  
  def select
    new_list = TodoList.new('New List')
    
    @todos.each do |todo|
      new_list.add(todo) if yield(todo)
    end
    
    new_list
  end
    
  # find_by_title
  # takes a string as argument, and returns the first Todo object that matches the argument. 
  # Return nil if no todo is found.
  def find_by_title(string)
    select { |todo| todo.title == string }.first    
  end
  
  # all_done
  # returns new TodoList object containing only the done items
  def all_done
    completed_todos = TodoList.new("Completed Todo's")
    each { |todo| completed_todos.add(todo) if todo.done? }
    completed_todos
  end
  
  def all_not_done
    incomplete_todos = TodoList.new("Incomplete Todo's")
    each { |todo| incomplete_todos.add(todo) if todo.done == false}
    incomplete_todos
  end
  
  # mark_done
  # takes a string as argument, and marks the first Todo object that matches the argument as done.
  def mark_done(string)
    find_by_title(string).done!
  end
  
  # mark_all_done
  # mark every todo as done
  def mark_all_done
    each {|todo| todo.done!}
  end
  
  # mark_all_undone
  # mark every todo as not done
  def mark_all_undone
    each {|todo| todo.undone!}
  end
end
    
# -------------------------------------------------

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!