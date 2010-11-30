module PrimeFactors
  
  def self.of(n)
    factors = []
    2.upto(n) do |divisor|
      factors << divisor and n/=divisor while n%divisor == 0
    end
    factors
  end
  
end