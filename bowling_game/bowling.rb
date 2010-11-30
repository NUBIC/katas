# bowling.rb
require File.expand_path(File.join(File.dirname(__FILE__), "frame"))

class Bowling
  
  attr_reader :current_frame
  
  def initialize
    @score = 0
    @current_frame = Frame.new
  end
  
  def roll(pins)
    if @current_frame.complete?
      @current_frame = Frame.new(@current_frame)
    end
    @current_frame.roll(pins)
  end
  
  def score
    result = 0
    frame = @current_frame
    until frame.nil?
      result += frame.score
      frame = frame.previous_frame
    end
    result
  end
  
end