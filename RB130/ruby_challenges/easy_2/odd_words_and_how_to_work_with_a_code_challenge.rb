# Tips

# Don't underestimate the problem and resist the urge to start coding. 
# Read the description 3 times; produce an outline if necessary. 
# communicate and clarify
# Have a plan (algorithm) 
# Verify with test cases. Happy paths, fail paths, edge cases.
# manage your energy


# "whats the matter with kansas." = "whats eht matter htiw kansas."

# TESTS:

# "whats the matter with kansas."
# "hello"
# "hello word."
# "hello word ."
# "hello  word ."

input =  "hello word  ."

def odd_words(str)
  if str[-1] == '.'
    words = str[0..-2].split(' ')
  else
    words = str.split(' ')
  end
  
  words.map.with_index do |word, index|
    if index.odd?
      word.reverse!
    else
      word
    end
  end

  if str[-1] == '.'
    words.join(' ') << '.'
  else
    words.join(' ')
  end
end

p odd_words(input)