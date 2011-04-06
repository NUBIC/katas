class Game
  
  attr_accessor :car_door_number
  attr_accessor :chosen_door_number
  
  def initialize(args = nil)
    @car_door_number    = rand(3)
    @chosen_door_number = rand(3)
    @doors = []
    3.times { |x| @doors << Door.new("goat") }
    @doors[@car_door_number].prize = "car"
  end
  
  def doors
    @doors
  end

  def opened_door_number
    ([0,1,2] - [@chosen_door_number, @car_door_number]).first
  end
  
  def switch_door_number
    ([0,1,2] - [@chosen_door_number, opened_door_number]).first
  end
  
  def stay_win
    @chosen_door_number == @car_door_number
  end
  
  def swap_win
    switch_door_number == @car_door_number
  end
  
end

class Door
  
  attr_accessor :prize
  
  def initialize(prize)
    @prize = prize
  end
  
end