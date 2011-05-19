require File.expand_path(File.join(File.dirname(__FILE__), "anagram"))

describe Anagram do
  let(:words) { %w( abc ab bca bac ba bc ) }
  let(:result) {[ %w( abc bca bac ), %w( ab ba ), %w( bc ) ]}
  
  it "should know if two things are anagrams of each other" do
    Anagram.anagram?("asdf", "fdsa").should be_true
  end
  
  it "should know if two words are not anagrams" do
    Anagram.anagram?("qwer", "fdsa").should_not be_true
  end
  
  it "should consider them case insensitive for anagramatical purposes" do
    Anagram.anagram?("BiL", "lib").should be_true
  end
  
  it "should collect anagram sets" do
    anagram = Anagram.new(words)
    anagram.sets.should =~ result
  end
    
  it "should accept an io object" do
    Anagram.from_io(StringIO.new(words.join("\n"))).should =~ result
  end
end