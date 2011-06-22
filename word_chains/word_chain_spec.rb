require File.expand_path(File.join(File.dirname(__FILE__), "word_chain"))

describe WordChain do
  
  it "should work in the one step case" do
    WordChain.chain('dog', 'dig').should == %w( dog dig )
  end
  
  it "should return just the single word if given the same word" do
    WordChain.chain('dog', 'dog').should == %w( dog )
  end

  describe "valid words" do
    it "should only accept words of the same length" do
      lambda { WordChain.chain('dog', 'do') }.should raise_error("Words must be of the same length.")
    end
    
    it "should only accept a start word in the wordlist" do
      lambda { WordChain.chain('z', 'a') }.should raise_error('"z" is not in the word list.')
    end
    
    it "should only accept an end word in the wordlist" do
      lambda { WordChain.chain('a', 'g') }.should raise_error('"g" is not in the word list.')
    end
    
  end
  
  it "should work for words with a potential solution" do
    WordChain.chain('cat', 'dog').should == %w( cat cot cog dog )
  end
  
  it "should work when going from ruby to code" do
    WordChain.chain('ruby', 'code').should == %w( ruby rubs robs rods rode code )
  end
  
  
end