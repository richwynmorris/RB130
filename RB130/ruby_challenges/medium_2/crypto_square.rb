class Crypto

  def initialize(input)
    @input = input
    @segments = []
    @ciphered_text = ''
    @normalized_ciphered_text = []
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

    string.chars.each_slice(@column) do |slice|
      @segments << slice.join
    end

    @segments
  end

  def ciphertext
    self.plaintext_segments
    count = 0

    until count == @segments[0].length
      @segments.each do |word|
        next if word[count] == nil
        @ciphered_text << word[count]
      end
      count += 1
    end
    @ciphered_text
  end

  def normalize_ciphertext
    self.ciphertext

    cipher_text = ''
    @column.times do |column|
      @segments.each do |row|
        cipher_text << (row[column] || '')
      end
      cipher_text << ' '
    end
    cipher_text.rstrip
  end
end

