module PrimeFactors
  
  # of 2
  
  # def self.of(n)
  #   factors = []
  #   if n > 1
  #     factors << 2 
  #   end
  #   factors
  # end
  
  # of 3
  
  # def self.of(n)
  #   factors = []
  #   if n > 1
  #     factors << n
  #   end
  #   factors
  # end


  # of 4

  # def self.of(n)
  #   factors = []
  #   if n > 1
  #     factors << 2 and n/=2 if n%2 == 0
  #     factors << n if n > 1
  #   end
  #   factors
  # end
  
  # of 8
  
  # def self.of(n)
  #   factors = []
  #   if n > 1
  #     factors << 2 and n/=2 while n%2 == 0
  #     factors << n if n > 1
  #   end
  #   factors
  # end
  
  # of 9
  
  def self.of(n)
    factors, divisor = [], 1
    # factors = []
    # divisor = 1
    while n > 1 and divisor += 1
      factors << divisor and n/=divisor while n%divisor == 0
      # divisor +=1 
      divisor = n-1 if divisor > Math.sqrt(n) # - speed enhancement
    end
    # factors << n if n > 1
    factors
  end

  
end