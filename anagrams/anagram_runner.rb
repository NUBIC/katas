require File.expand_path("../anagram", __FILE__)
require 'benchmark'
require 'benchmark/ips'

word_list = File.readlines("wordlist.txt").collect(&:chomp)

Benchmark.ips do |x|
  x.report("anagram?") { Anagram.anagram?("kinship", "pinkish")}
end

Benchmark.bm do |suite|
  [(1000..1010), (1000..1100)].each do |range| 
    suite.report("on word list #{range}") do
      Anagram.new(word_list[range]).sets
    end
  end
end