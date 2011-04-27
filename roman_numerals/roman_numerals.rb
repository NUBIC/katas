class RomanNumeralError < StandardError ; end
def to_roman_numeral(i)
  raise RomanNumeralError if i <= 0

  [%w(1000 M),
   %w(900 CM),
   %w(500 D),
   %w(400 CD),
   %w(100 C),
   %w(90 XC),
   %w(50 L),
   %w(40 XL),
   %w(10 X),
   %w(9 IX),
   %w(5 V),
   %w(4 IV),
   %w(1 I)].map { |a, r| [a.to_i, r] }.inject("") do |r, (arabic, roman)|
     while i >= arabic
       r << roman
       i -= arabic
     end
     r
   end
  
end