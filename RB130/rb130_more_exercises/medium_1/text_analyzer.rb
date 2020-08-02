class TextAnalyzer
  def process(&block)
    file = File.open('sample_text.txt')
    block.call(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |param| puts "#{param.split("\n\n").count} paragraphs" }
analyzer.process { |param| puts "#{param.split("\n").count } lines" }
analyzer.process { |param| puts "#{param.split(" ").count} words" }

# 3 paragraphs
# 15 lines
# 126 words