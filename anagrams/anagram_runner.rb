require File.expand_path("../anagram", __FILE__)
require 'benchmark'
require 'benchmark/ips'

word_list = File.readlines("wordlist.txt").collect(&:chomp)

Benchmark.ips do |suite|
  [(1000..1010), (1000..1100), (1000..2000), (1000..11000), (0..-1)].each do |range| 
    suite.report("sets #{range.inspect} #{range.last - range.first}") do
      Anagram.new(word_list[range]).sets
    end
  end
end

Benchmark.bm do |suite|
  suite.report("on word list file") do
    Anagram.new(File.new("wordlist.txt")).sets
  end
end

