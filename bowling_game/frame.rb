class Frame
  attr_reader :previous_frame
  attr_accessor :next_frame
  attr_reader :number
  
  def initialize(previous_frame = nil)
    @previous_frame = previous_frame
    @previous_frame.next_frame = self if previous_frame
    @number = previous_frame ? previous_frame.number + 1 : 1
    @rolls = []
  end
  
  def roll(pins)
    @rolls << pins
  end
  
  def first
    @rolls.first
  end
  
  def second
    @rolls[1]
  end
  
  def spare?
    return false unless second
    first + second == 10
  end
  
  def strike?
    first == 10
  end
  
  def sum_of_rolls
    @rolls.inject {|sum, n| sum + n}
  end
  
  def first_frame?
    @previous_frame.nil?
  end
  
  def complete?
    if number == 10
      if strike?
        @rolls.size == 3
      elsif spare?
        @rolls.size == 3
      else
        second
      end
    else
      second or strike?
    end
  end
  
  def score
    if strike? and next_frame
      10 + sum_of_next_two_rolls
    elsif spare? and next_frame
      10 + next_frame.first
    else
      sum_of_rolls
    end
  end
  
  private

    def sum_of_next_two_rolls
      if next_frame.second
        next_frame.first + next_frame.second 
      elsif next_frame.next_frame
        next_frame.first + next_frame.next_frame.first
      else
        next_frame.first
      end
    end
  
end