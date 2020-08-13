class PigLatin

  REGIONAL_LETTERS = /[ch|qu|th|thr|sch|]/

  def self.translate(words)
    words.split.map! do |word|
      if word[0].match?(/[AEIOUaeiou]/) || word(0..1).slice.match? (/xr/)
        word << 'ay'
      else
        word << word.slice!(0) << 'ay'
      end
    end.join(' ')
  end
end

p PigLatin.translate('apple')