class CircularBuffer
  class BufferEmptyException < StandardError ; end
  class BufferFullException < StandardError ; end

  def initialize(length)
    @buffer_length = length
    @c_buffer = []
  end

  def read
    raise BufferEmptyException if @c_buffer.empty?
    @c_buffer.shift
  end

  def write(el)
    raise BufferFullException if @c_buffer.length >= @buffer_length
    @c_buffer << el unless el == nil
  end

  def write!(el)
    if @c_buffer.length < @buffer_length
      @c_buffer << el unless el == nil
    else
      @c_buffer.shift && @c_buffer.push(el) unless el == nil
    end
  end

  def clear
    @c_buffer.clear
  end
end

    # buffer = CircularBuffer.new(3)
    # ('1'..'3').each { |i| buffer.write i }
    # buffer.clear
    # p buffer.display_buffer
    #  buffer.read
    # buffer.write '1'
    # buffer.write '2'
    # assert_equal '1', buffer.read
    # buffer.write '3'
    # assert_equal '2', buffer.read