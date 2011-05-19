(1..100).each do |num|
  if num % 3 == 0
    print 'Fizz'
  end

  if num % 5 == 0
    print 'Buzz'
  end
  
  unless num % 3 == 0 || num % 5 == 0
    print num
  end

  puts
end
