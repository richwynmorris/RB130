class Crypto
  def initialize(input)
    @input = input
    @segments = []
    @ciphered_text = []
  end

  def normalize_plaintext
    @input.downcase.gsub(/[^a-z0-9]/, '')
  end

  def size
    @size = normalize_plaintext.length
    @column = Math.sqrt(@size).ceil
  end

  def plaintext_segments
    self.size
    string = normalize_plaintext.dup

    until string.empty?
      @segments << string.slice!(0..@column - 1)
    end

    @segments
  end

  def ciphertext
    self.plaintext_segments
    count = 0

    loop do
      break if count == @segments[0].length - 1
      @segments.each do |word|
        break if word[count] == nil
        @ciphered_word = ''
        @ciphered_word << word[count]
      end
      @ciphered_text << [@ciphered_word]
      count += 1
    end

    @ciphered_text.flatten.join
  end
end

crypto = Crypto.new('Time is an illusion. Lunchtime doubly so.')
crypto.ciphertext