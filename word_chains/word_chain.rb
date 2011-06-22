class WordChain

  
  def self.word_list
    @word_list ||= File.readlines(File.expand_path("../words.txt", __FILE__)).map(&:chomp)
  end
  
  def self.chain(s, e, path=[])
    raise "Words must be of the same length." if s.length != e.length
    
    validate_word(s)
    validate_word(e)
      
    return [s] if s == e
    return path + [s, e] if hamming_distance(s, e) == 1

    find_one_away(s).each do |candidate|
      puts "Recursing on #{candidate.inspect} from #{s.inspect}"
      next if path.include?(candidate)
      if result = chain(candidate, e, path + [s])
        return result
      end
    end
    nil
  end
  
  private
  
  def self.validate_word(word)
    raise "#{word.inspect} is not in the word list." unless word_list.include?(word)
  end
  
  def self.hamming_distance(s, e)
    ct = 0
    for i in (0 ... s.length)
      ct += 1 if s[i] != e[i]
    end
    ct
  end

  def self.find_one_away(s)
    word_list.select { |w| w.length == s.length }.
      tap { |wl| puts "There are #{wl.size} strings of the same length as #{s.inspect}" }.
      select { |w| hamming_distance(s, w) == 1 }.
      tap { |wl| puts "There are #{wl.size} strings one away from #{s.inspect}" }
  end

end