require 'minitest/autorun'

require_relative 'starter_file.rb'

class SampleTest < Minitest::Test
  def setup
    @file = File.open('sample_text.txt')
    @text = Text.new(@file.read)
  end

  def test_swap
    test = File.read('sample_text.txt')
    result = test.gsub('a', 'e')
    assert_equal(result, @text.swap('a', 'e'))
  end

  def test_word_count
    test = File.read('sample_text.txt')
    result = test.split.count
    assert_equal(result, @text.word_count)
  end

  def teardown
    @file.close
     puts "File has been closed: #{@file.closed?}"
  end
end