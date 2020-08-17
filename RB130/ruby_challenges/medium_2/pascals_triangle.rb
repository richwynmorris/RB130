class Triangle
  def initialize(request)
    @rows_request = request
    @rows = [[1]]
  end

  def rows
    return @rows if @rows_request == 1
    count = 1
    
    loop do
      break if count == @rows_request
      @rows << [1, @rows.last.each_cons(2).map(&:sum), 1].flatten
      count += 1
    end
    @rows
  end

  def last
    self.rows
    @rows.pop
  end
end