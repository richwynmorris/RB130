class TextAnalyzer
  def process(&block)
    file = File.open('sample_text.txt', "r")
    block.call(file)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |param| puts "#{param.read.split("\n\n").count} paragraphs" }
analyzer.process { |param| puts "#{param.readlines.count } lines" }
analyzer.process { |param| puts "#{param.read.split(" ").count} words" }

# 3 paragraphs
# 15 lines
# 126 words