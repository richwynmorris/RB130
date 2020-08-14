class School
  def initialize
    @students = {}
  end

  def to_h
    @students.each do |grade, arr|
      arr.sort!
    end
    @students.sort_by {|k,v| k}.to_h
  end

  def add(name, grade)
    if @students.keys.include?(grade)
      @students[grade] << name
    else
      @students[grade] = [name]
    end
  end

  def grade(num)
    return [] if !@students.keys.include?(num)
    @students.values_at(num).flatten
  end
end