require File.expand_path(File.join(File.dirname(__FILE__), "prime_factors"))

describe PrimeFactors do
  
  [
    ['0', []],
    ['1', []],
    ['2', [2]],
    ['3', [3]],
    ['4', [2] * 2],
    ['5', [5]],
    ['6', [2, 3]],
    ['8', [2] * 3],
    ['9', [3] * 2],
    ['2*3*5*7*11*13', [2,3,5,7,11,13]],
    ['37*37', [37,37]],
    ['2**19-1', [2**19-1]]
  ].each do |exp, factors|
    it "should factor #{eval exp}" do
      number = eval exp
      PrimeFactors.of(number).should == factors
    end
  end
  
end
