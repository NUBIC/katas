# bowling.rb
class Bowling
  
  def initialize
    @rolls = []
    @current_roll = 0
  end
  
  def roll(number_of_pins)
    @rolls[@current_roll] = number_of_pins
    @current_roll += 1
  end
  
  def score
    result = 0
    frame_index = 0
    10.times do
      if is_strike?(frame_index)
        result += 10 + strike_bonus(frame_index)
        frame_index += 1
      elsif is_spare?(frame_index)
        result += 10 + spare_bonus(frame_index)
        frame_index += 2
      else
        result += frame_score(frame_index)
        frame_index += 2
      end
    end
    result
  end
  
  def is_spare?(frame_index)
    (@rolls[frame_index].to_i + @rolls[frame_index+1].to_i) == 10
  end
  
  def spare_bonus(frame_index)
    @rolls[frame_index+2].to_i
  end
  
  def is_strike?(frame_index)
    @rolls[frame_index].to_i == 10
  end
  
  def strike_bonus(frame_index)
    @rolls[frame_index+1].to_i + @rolls[frame_index+2].to_i
  end
  
  def frame_score(frame_index)
    @rolls[frame_index].to_i + @rolls[frame_index+1].to_i
  end
  
end
