class Game
  
  attr_accessor :car_door_number
  attr_accessor :chosen_door_number
  
  def initialize(car_door_number = nil)
    @car_door_number = car_door_number || rand(3)
    @doors = []
    3.times { |x| @doors << Door.new("goat") }
    @doors[@car_door_number].prize = "car"
  end
  
  def doors
    @doors
  end
  
  def choose_door(chosen_door_number)
    @chosen_door_number = chosen_door_number
    self
  end
  
  def opened_door_number
    ([0,1,2] - [chosen_door_number, car_door_number]).first
  end
  
  def stay_winner?
    chosen_door_number == car_door_number
  end
  
end

class Door
  
  attr_accessor :prize
  
  def initialize(prize)
    @prize = prize
  end
  
end

class Simulation
  
  attr_accessor :swap_win_count
  attr_accessor :stay_win_count
  
  def run(number_of_games)
    @stay_win_count = 0
    @swap_win_count = 0
    number_of_games.times do
      game = Game.new
      game.choose_door(rand(3))
      if game.stay_winner?
        @stay_win_count += 1 
      else
        @swap_win_count += 1
      end
    end
  end
  
  def swap_win_percentage
    (@swap_win_count.to_f / total) * 100
  end
  
  def stay_win_percentage
    100 - swap_win_percentage
  end
  
  def total
    @stay_win_count + @swap_win_count
  end
  
end