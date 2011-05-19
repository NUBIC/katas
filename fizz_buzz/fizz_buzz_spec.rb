require File.expand_path(File.join(File.dirname(__FILE__), "fizz_buzzer"))

describe FizzBuzzer do

  before(:each) do
    @fb = FizzBuzzer.new
  end

  it "should return the number if 1" do
    @fb.print(1).should == "1"
  end
  
  it "should return 'Fizz' if 3" do
    @fb.print(3).should == "Fizz"
  end

end