# puts "hello";

# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. 
# The sum of these multiples is 23.
# 
# Find the sum of all the multiples of 3 or 5 below 1000.

# sum = 0
# (1...1000).each do |x|
#   sum += x if x%3 == 0 || x%5 == 0
# end
# 
# puts "#{sum}" 


# Write a program that prints the numbers from 1 to 100.
# But for multiples of three print “Fizz” instead of the number
# and for the multiples of five print “Buzz”.
# For numbers which are multiples of both three and five print “FizzBuzz”.

# 1.
(1..100).each do |x|
  if (x % 3 == 0) && (x % 5 == 0)
    p "FizzBuzz"
  elsif (x % 3 == 0)
    p "Fizz"
  elsif (x % 5 == 0)
    p "Buzz"
  else
    p x
  end
end

# 2.
(1..100).each do |x|
  result = ""
  result += "Fizz" if (x % 3 == 0)
  result += "Buzz" if (x % 5 == 0)
  result = x if result == ""
  p result
end

# 3.
1.upto(100) do |x|
  case 
  when (x % 3 == 0) && (x % 5 == 0)
    p "FizzBuzz"
  when x % 3 == 0
    p "Fizz"
  when x % 3 == 0
    p "Fizz"
  else 
    p x
  end
end
  
