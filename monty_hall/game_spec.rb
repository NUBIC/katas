require File.expand_path(File.join(File.dirname(__FILE__), "game"))

describe Game do
  
  let(:game) { Game.new }
  
  it "should have three doors" do
    game.should have(3).doors
  end
  
  it "should have one prize behind each door (which is a string - to be redeemed)" do
    game.doors.each do |door| 
      door.prize.should_not be_nil 
      door.prize.is_a?(String).should be_true
    end
  end
  
  it "should only have one car behind all three doors" do
    car_doors = []
    game.doors.each { |door| car_doors << door if door.prize == "car" }
    car_doors.size.should == 1
  end
  
  it "should only have two goats behind the other doors" do
    goat_doors = []
    game.doors.each { |door| goat_doors << door if door.prize == "goat" }
    goat_doors.size.should == 2
  end
  
  it "should not always have a car behind door #3" do
    car_doors = []
    10.times do |x|
      game = Game.new
      game.doors.each_with_index {|door, index| car_doors << index if door.prize == "car"}
    end
    car_doors.uniq.size.should > 1
  end
  
  it "should choose a user selected door at random" do
    chosen_doors = []
    10.times do
      game = Game.new
      chosen_doors << game.chosen_door_number
    end
    chosen_doors.uniq.size.should > 1
  end
  
  it "should know if the chosen door won the car" do

  end
  
end