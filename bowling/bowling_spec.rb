require File.expand_path(File.join(File.dirname(__FILE__), "bowling"))

describe Bowling, "#score" do
  before(:each) do
    @game = Bowling.new
  end
  
  def roll_many(num, pins)
    num.times { @game.roll(pins) }
  end
  
  it "should returns 0 for all gutter game" do
    roll_many(20, 0)
    @game.score.should == 0
  end
  
  it "should return 20 for all ones" do
    roll_many(20, 1)
    @game.score.should == 20
  end
  
  it "should score 16 when make a spare and 3 after " do
    roll_spare
    @game.roll(3)
    roll_many(16, 0)
    @game.score.should == 16
  end
  
  def roll_spare
    @game.roll(5)
    @game.roll(5)
  end

  it "should score 24 when make a strike and 3 and 4 after " do
    roll_strike
    @game.roll(3)
    @game.roll(4)
    roll_many(16, 0)
    @game.score.should == 24
  end
  
  def roll_strike()
    @game.roll(10)
  end
  
  it "should score 300 for a perfect game" do
    roll_many(12, 10)
    @game.score.should == 300
  end
  
end
