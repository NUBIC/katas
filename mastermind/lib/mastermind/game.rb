module Mastermind
  class Game
    
    def initialize(messenger)
      @messenger = messenger
      @guess_counter = 0
    end
    
    def start(secret_code = nil)
      @scorer = Scorer.new(secret_code)
      @messenger.puts "Welcome to Mastermind!"
      @messenger.puts "Enter guess:"
    end
    
    def guess(guess)
      @guess_counter += 1
      print_mark(guess)
      print_game_over_message
    end
    
    def over?
      true
    end
    
    def print_game_over_message
      @messenger.puts "#{'Congratulations! ' if @guess_counter < 3}You broke the code in #{@guess_counter} guess#{'es' if @guess_counter != 1}."
    end
    
    def print_mark(guess)
      @messenger.puts "Score for [#{guess.join(' ')}] is #{@scorer.mark(guess)}"
    end
    
  end
end