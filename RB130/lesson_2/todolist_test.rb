require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_not_todo_object
    assert_raises(TypeError) do 
      str = 'Hello'
      @list.add(str)
    end
  end

  def test_alias
    @todo4 = Todo.new("Take Hudson for a walk")
    @list.add(@todo4)
    @todos << @todo4

    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_raises(IndexError) do 
      @list.item_at(3)
    end
    assert_equal(@todo1, @list.item_at(0))
  end

  def test_mark_done_at
    @list.mark_done_at(0)
    assert_raises(IndexError) {@list.mark_done_at(3)}
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo2.done?)
  end

  def test_mark_undone_at
    @todo1.done!
    @todo2.done!
    @todo3.done!

    @list.mark_undone_at(1)

    assert_raises(IndexError) {@list.mark_undone_at(3)}
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_done!
    @list.done!

    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) {@list.mark_done_at(3)}
    @list.remove_at(0)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_done
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    @list.mark_done_at(0)

    assert_equal(output, @list.to_s)
  end

  def test_each
    results = []

    @list.each do |todo|
      results << todo
    end

    assert_equal(results, @list.to_a)
  end

  def test_each_return
    return_object = @list.each {|todo| puts todo }
    assert_equal(return_object, @list)
  end

  def test_select
    @todo1.done!
    list = TodoList.new(@list.title)
    list.add(@todo1)

    assert_equal(list.title, @list.title)
    assert_equal(list.to_s, @list.select{ |todo| todo.done? }.to_s)
  end

  def test_find_by_title
    assert_equal(@todo1, @list.find_by_title('Buy milk'))
  end

  def test_all_done
    @todo1.done!

    selected_dones = TodoList.new(@list.title)
    selected_dones.add(@todo1)

    assert_equal(selected_dones.to_s, @list.all_done.to_s)
  end

  def test_all_not_done
    selected_undone = TodoList.new(@list.title)
    selected_undone.add(@todo1)
    selected_undone.add(@todo2)
    selected_undone.add(@todo3)

    assert_equal(selected_undone.to_s, @list.all_not_done.to_s)
  end

  def test_mark_done
    new_list = TodoList.new(@list.title)
    new_list.add(@todo1)
    new_list.mark_done_at(0)
    @list.mark_done('Buy milk')
    assert_equal(new_list.all_done.to_s, @list.all_done.to_s)  
  end

  def test_mark_all_done

    new_list = TodoList.new(@list.title)

    @todos.each do |todo|
      new_list.add(todo)
    end

    new_list.each do |todo|
      todo.done!
    end

    assert_equal(new_list.to_s, @list.mark_all_done.to_s)
  end

  def test_mark_all_undone

    @list.mark_all_done

    new_list = TodoList.new(@list.title)

    @todos.each do |todo|
      new_list.add(todo)
    end

    @list.mark_all_undone

    assert_equal(new_list.to_s, @list.to_s)
  end
end