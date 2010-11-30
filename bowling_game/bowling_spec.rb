require File.expand_path(File.join(File.dirname(__FILE__), "bowling"))

describe Bowling do
  
  let(:game) { Bowling.new }
  
  def roll_many(num, pins)
    num.times { game.roll(pins) }
  end
  
  it "should score 0 for a gutter game" do
    roll_many(20, 0)
    game.score.should == 0
  end
  
  it "should score 20 for all ones game" do
    roll_many(20, 1)
    game.score.should == 20
  end
  
  it "should score 10 plus the next roll for a spare" do
    game.roll(5)
    game.roll(5)
    game.roll(3)
    roll_many(17, 0)
    game.score.should == 16
  end

  it "should score 10 plus the next 2 rolls for a strike" do
    game.roll(10)
    game.roll(5)
    game.roll(3)
    roll_many(16, 0)
    game.score.should == 26
  end
  
  it "should score 300 if a perfect game" do
    roll_many(12, 10)
    game.current_frame.number.should == 10
    game.current_frame.should be_complete
    game.current_frame.score.should == 30
    game.current_frame.previous_frame.score.should == 30
    game.score.should == 300  
  end
  
  it "should properly score ruby quiz 181" do
    rolls = %w( 6 2 7 1 10 9 0 8 2 10 10 3 5 7 2 5 5 8 )
    rolls.each { |roll| game.roll(roll.to_i) }
    game.score.should == 140
  end
  
end