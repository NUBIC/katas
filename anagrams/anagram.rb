require 'forwardable'
class Anagram
  extend Forwardable
  attr_accessor :words
  
  def_delegator self, :anagram?
  
  def initialize(words)
    @words = words
  end
  
  def self.from_io(io)
    new(io.readlines.collect(&:chomp)).sets
  end
  
  def sets
    result = Hash.new
    @words.each do |w|
      result[w] = []
      @words.each do |w2|
        result[w] << w2 if anagram?(w, w2)
      end
    end 
    result.values.uniq
  end
  
  class << self
    def anagram?(a, b)
      a.downcase.split('').sort == b.downcase.split('').sort
    end
  end
end