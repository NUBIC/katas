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
  
  it "should not always have a car behind the same door" do
    car_doors = []
    20.times do |x|
      game = Game.new
      game.doors.each_with_index {|door, index| car_doors << index if door.prize == "car"}
    end
    car_doors.uniq.size.should > 1
    car_doors.uniq.size.should == 3
  end
  
  it "should allow player to choose a door" do
    game.choose_door(2).chosen_door_number.should == 2
  end
  
  it "should know if the chosen door is a winner" do
    game.choose_door(game.car_door_number).should be_stay_winner
  end
  
  it "should allow the ability to set the car door 0" do
    game = Game.new(0)
    game.car_door_number.should == 0
    game.doors.collect(&:prize).should == %w(car goat goat)
  end

  it "should allow the ability to set the car door 1" do
    game = Game.new(1)
    game.doors.collect(&:prize).should == %w(goat car goat)
  end
  
  it "should allow the ability to set the car door 2" do
    game = Game.new(2)
    game.doors.collect(&:prize).should == %w(goat goat car)
  end
  
  it "should pick a goat door to show the player if the player chose the car door" do
    Game.new(1).choose_door(1).opened_door_number.should == 0
  end
  
  it "should pick a goat door to show the player if the player chose the goat door 1" do
    Game.new(0).choose_door(1).opened_door_number.should == 2
  end
  
  it "should pick a goat door to show the player if the player chose the goat door 2" do
    Game.new(0).choose_door(2).opened_door_number.should == 1
  end
  
  describe "simulation" do
    let(:simulation) { Simulation.new }
    
    it "should win with a swap strategy 66% of the time and with a stay strategy 33% of the time" do
      simulation.run(50000)
      (65...67).should include(simulation.swap_win_percentage)
      (32...34).should include(simulation.stay_win_percentage)
    end
    
  end
  
end