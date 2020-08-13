class PigLatin

  REGIONAL_LETTERS_TWO = ['ch','qu','th','thr','sch']
  REGIONAL_LETTERS_THREE = ['thr','sch']

  def self.translate(words)
    words.split.map! do |word|
      if word[0].match?(/[AEIOUaeiou]/) || word.slice(0..1).match?(/xr|yt/) 
        word << 'ay'
      else
        if REGIONAL_LETTERS_THREE.include?(word.slice(0..2))
          word << word.slice!(0..2) << 'ay'
        elsif REGIONAL_LETTERS_TWO.include?(word.slice(0..1))
          word << word.slice!(0..1) << 'ay'
        elsif word[0].match?(/[a-z^aeiou]/) && word.slice(1..2).match?(/qu/)
          word << word.slice!(0..2) << 'ay'
        else
          word << word.slice!(0) << 'ay'
        end
      end
    end.join(' ')
  end
end