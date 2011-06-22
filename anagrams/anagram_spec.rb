require File.expand_path(File.join(File.dirname(__FILE__), "anagram"))

describe Anagram do
  let(:words) { %w( abc ab bca bac ba bc ) }
  let(:result) {[ %w( abc bca bac ), %w( ab ba ), %w( bc ) ]}
  
  it "should collect anagram sets" do
    anagram = Anagram.new(words)
    anagram.sets.should =~ result
  end
    
  it "should accept an io object" do
    Anagram.from_io(StringIO.new(words.join("\n"))).should =~ result
  end
end