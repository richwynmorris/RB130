# Write a regex that matches an uppercase K. Test it with these strings:

p 'Kx'.match(/K/)
p 'BlacK'.match(/K/)
p 'kelly'.match(/K/)


# Write a regex that matches an uppercase or lowercase H. Test it with these strings:

Henry
perch
golf

# Answer 
/H|h/


# Write a regex that matches the string dragon. Test it with these strings:

snapdragon
bearded dragon
dragoon

# Answer
/dragon/


# Write a regex that matches any of the following fruits: banana, orange, apple, strawberry. The fruits may appear in other words. Test it with these strings:

banana
orange
pineapples
strawberry
raspberry
grappler


# Answer:
/banana|orange|apple|strawberry/


# Write a regex that matches a comma or space. Test your regex with these strings:

This line has spaces
This,line,has,commas,
No-spaces-or-commas

# Answer
/\,| /


# Write a regex that matches blueberry or blackberry, but write berry precisely once. Test it with these strings:

blueberry
blackberry
black berry
strawberry

# There should be two matches.

# Answer
/(blue|black)berry/


# Write a regex that matches uppercase or lowercase Ks or a lowercase s. Test it with these strings:

Kitchen Kaboodle
Reds and blues
kitchen Servers

#There should be six matches.

# Answer
/[Kk]|s/

# Write a regex that matches any of the strings cat, cot, cut, bat, bot, or but, regardless of case. Test it with this text:

My cats, Butterscotch and Pudding, like to
sleep on my cot with me, but they cut my sleep
short with acrobatics when breakfast time rolls
around. I need a robotic cat feeder.


# Answer
/(cat|cot|cut|bat|bot|but)/i

# Base 20 digits include the decimal digits 0 through 9, and the letters A through J in upper or lowercase. Write a regex that matches base 20 digits. Test it with these strings:

0xDEADBEEF
1234.5678
Jamaica
plow ahead

# Answer
/[0-9A-Ja-j]/

# Write a regex that matches any letter except x or X. Test it with these strings:

0x1234
Too many XXXXXXXXXXxxxxxxXXXXXXXXXXXX to count.
The quick brown fox jumps over the lazy dog
THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG

# Answer
/[A-WYZa-wYZ]/

# Why is /[^xX]/ not a valid answer to the previous exercise?
# It's not a valid answer as it the exclusion syntax will include everything that isn't designated. This means it will include not only letters but numbers, symbols and whitespace. 

# Are /(ABC|abc)/ and /[Aa][Bb][Cc]/ equivalent regex? If not, how do they differ? Can you provide an example of a string that would match one of these regex, but not the other?

# They differ as the first checks for matches that include ABC or abc. The second checks for matches that include the specific characters.

# 'AbC' won't work for the first but will for the second.

# Are /abc/i and /[Aa][Bb][Cc]/ equivalent regex? If not, how do they differ? Can you provide an example of a string that would match one of these regex, but not the other?

# Yes they are the equivalent to one another.

#Challenge: write a regex that matches a string that looks like a simple negated character class range, e.g., '[^a-z]'. (Your answer should match precisely six characters.) Test it with these strings:

The regex /[^a-z]/i matches any character that is
not a letter. Similarly, /[^0-9]/ matches any
non-digit while /[^A-Z]/ matches any character
that is not an uppercase letter. Beware: /[^+-<]/
is at best obscure, and may even be wrong.

#There should be three matches.

/\[\^(a-z|A-Z|0-9)]/ || /\[\^[a-z|A-Z|0-9]-[a-z|A-Z|0-9]]/






