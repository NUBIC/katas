class Game
  
  def initialize(args = nil)
    car_door_idx = rand(3)
    @doors = []
    3.times { |x| @doors << Door.new("goat") }
    @doors[car_door_idx].prize = "car"
  end
  
  def doors
    @doors
  end
  
  def chosen_door_number
    rand(3)
  end
  
end

class Door
  
  attr_accessor :prize
  
  def initialize(prize)
    @prize = prize
  end
  
end