# Write a method that returns a list of all of the divisors of the positive integer passed in as an argument. 
# he return value can be in any sequence you wish.

# Examples

def divisors(num)
  results = []
  
  1.upto(num) do |current_num|
    results << current_num if num % current_num == 0
  end
  
  results
end

divisors(1) == [1]
divisors(7) == [1, 7]
divisors(12) == [1, 2, 3, 4, 6, 12]
divisors(98) == [1, 2, 7, 14, 49, 98]
divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute