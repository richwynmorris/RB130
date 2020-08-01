def decipher(str)
  letters = str.chars
  
  uppercase = ('A'..'Z').to_a * 2
  lowercase = ('a'..'z').to_a * 2
  
  letters.map! do |letter|
    if letter.match(/\W/)
      letter
    elsif letter == letter.upcase
      index = uppercase.index(letter) + 13
      uppercase[index]
    elsif letter == letter.downcase
      index = lowercase.index(letter) + 13
      lowercase[index]
    end
  end
  
  letters.join
end

p decipher('Lhxvuveb Zngfhzbgb')