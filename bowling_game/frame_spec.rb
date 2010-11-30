require File.expand_path(File.join(File.dirname(__FILE__), "frame"))

describe Frame do
  
  context "the Frame class" do
    let(:frame) { Frame.new }
  
    it "can store one roll" do
      frame.roll(1)
      frame.first.should == 1
    end
  
    it "can store two rolls" do
      frame.roll(1)
      frame.roll(2)
      frame.first.should == 1
      frame.second.should == 2
    end
  
    it "should be a spare if first roll and 2nd roll == 10" do
      frame.roll(6)
      frame.roll(4)
      frame.should be_spare
    end

    it "should not be a spare if there is only one roll" do
      frame.roll(6)
      frame.should_not be_spare    
    end
  
    it "should not be a spare if 1st and 2nd roll do not add up to ten" do
      frame.roll(6)
      frame.roll(1)
      frame.should_not be_spare
    end

    it "should know the sum of the rolls for the frame" do
      frame.roll(6)
      frame.sum_of_rolls.should == 6
      frame.roll(1)
      frame.sum_of_rolls.should == 7
    end
  
    it "should be a strike if the first roll == 10" do
      frame.roll(10)
      frame.should be_strike
    end
  
    it "should know its previous frame" do
      new_frame = Frame.new(frame)
      new_frame.previous_frame.should == frame
    end
  
    it "should know if it is the first frame" do
      frame.should be_first_frame
    end
  
    it "should be complete if there are two rolls" do
      frame.roll(6)
      frame.roll(1)
      frame.should be_complete
    end
  
    it "should be complete if it is a strike" do
      frame.roll(10)
      frame.should be_complete
    end
  
    it "should know its next frame" do
      new_frame = Frame.new(frame)
      frame.next_frame.should == new_frame
    end
    
    it "should know its frame number" do
      second_frame = Frame.new(frame)
      third_frame = Frame.new(second_frame)
      
      frame.number.should == 1
      second_frame.number.should == 2
      third_frame.number.should == 3
    end
    
    describe "the tenth frame" do
      let(:tenth) do
        tenth = frame
        9.times { tenth = Frame.new(tenth) }
        tenth
      end
      
      it "should not be complete if it is a strike and only one roll" do
        tenth.roll(10)
        tenth.should_not be_complete
      end
      
      it "should be complete if it is a strike and there are two more rolls" do
        tenth.roll(10)
        tenth.roll(2)
        tenth.roll(8)
        tenth.should be_complete
      end
      
      it "should be complete if there are two non-marked rolls" do
        tenth.roll(2)
        tenth.roll(7)
        tenth.should be_complete
      end
      
      it "should not be complete if it is a spare and there are only two rolls" do
        tenth.roll(3)
        tenth.roll(7)
        tenth.should_not be_complete
      end
      
      it "should be complete if it is a spare and there are three rolls" do
        tenth.roll(3)
        tenth.roll(7)
        tenth.roll(7)
        tenth.should be_complete
      end
      
      
    end
    
  end
  
  context "scoring" do
    
    let(:frame)        { Frame.new }
    let(:second_frame) { Frame.new(frame) }
    let(:third_frame)  { Frame.new(second_frame) }
    
    it "should have a score of zero for a frame of gutter balls" do
      frame.roll(0)
      frame.roll(0)
      frame.score.should == 0
    end
    
    it "should sum the two rolls in an unmarked frame" do
      frame.roll(1)
      frame.roll(2)
      frame.score.should == 3
    end
    
    it "should score a spare without a next roll as ten" do
      frame.roll(7)
      frame.roll(3)
      frame.score.should == 10
    end
    
    it "should score a spare with a next roll as ten plus the next roll" do
      frame.roll(7)
      frame.roll(3)
      second_frame.roll(3)
      second_frame.roll(2)
      frame.score.should == 13
    end
    
    it "should score a strike without a next roll as ten" do
      frame.roll(10)
      frame.score.should == 10
    end
    
    it "should score a strike with a non-mark next frame as ten plus the next two rolls" do
      frame.roll(10)
      second_frame.roll(3)
      second_frame.roll(6)
      frame.score.should == 19
    end
    
    it "should score a strike followed by a spare as 20" do
      frame.roll(10)
      second_frame.roll(4)
      second_frame.roll(6)
      frame.score.should == 20
    end
    
    it "should score a strike followed by a strike followed by a non-mark roll as 10 plus the sum of the next two rolls" do
      frame.roll(10)
      second_frame.roll(10)
      third_frame.roll(6)
      third_frame.roll(2)
      frame.score.should == 26
    end
    
    it "should score 30 for a turkey (three strikes in a row)" do
      frame.roll(10)
      second_frame.roll(10)
      third_frame.roll(10)
      frame.score.should == 30
    end
    
  end
  
end