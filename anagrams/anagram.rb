require 'forwardable'
class Anagram
  attr_accessor :words
  
  def initialize(words)
    @words = words
  end
  
  def self.from_io(io)
    new(io.readlines.collect(&:chomp)).sets
  end
  
  def sets
    result = Hash.new
    @words.each do |w|
      sorted = w.downcase.split('').sort
      if result.has_key?(sorted)
        result[sorted] << w
      else
        result[sorted] = [w]
      end
    end 
    result.values
  end
end