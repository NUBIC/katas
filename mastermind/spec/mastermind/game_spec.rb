require File.join(File.dirname(__FILE__), "/../spec_helper")

module Mastermind
  describe Game do
    
    before(:each) do
      @messenger = StringIO.new
      @game = Game.new(@messenger)
    end
    
    context "starting up" do
      it "should send a welcome message" do
        @game.start
        @messenger.string.should =~ /Welcome to Mastermind!/
      end

      it "should prompt for the first guess" do
        @game.start
        @messenger.string.should =~ /Enter guess:/
      end
    end
    
    context "breaking the code" do

      before(:each) do
        @game.start(%w[r g y b])
      end
      
      context "on the first guess" do
        
        before(:each) do
          @game.guess(%w[r g y b])
        end
        
        it "should be over" do
          @game.should be_over
        end
        
        it "should return the message 'Congratulations! You broke the code in 1 guess.'" do
          @messenger.string.should =~ /Congratulations! You broke the code in 1 guess./
        end
        
      end
      
      context "on the second guess" do
        
        before(:each) do
          @game.guess(%w[c c c c])
          @game.guess(%w[r g y b])
        end
        
        it "should be over" do
          @game.should be_over
        end
        
        it "should return the message 'Congratulations! You broke the code in 2 guesses.'" do
          @messenger.string.should =~ /Congratulations! You broke the code in 2 guesses./
        end
        
      end
      
      context "on three or more guesses" do
        before(:each) do
          @game.guess(%w[c c c c])
          @game.guess(%w[c c c c])
        end
        
        it "should return the message 'You broke the code in 3 guesses.'" do
          @game.guess(%w[r g y b])
          @messenger.string.should =~ /\nYou broke the code in 3 guesses./m
        end
        
        it "should return the message 'You broke the code in 4 guesses.'" do
          @game.guess(%w[c c c c])
          @game.guess(%w[r g y b])
          @messenger.string.should =~ /\nYou broke the code in 4 guesses./m
        end
        
      end
      
    end
    
  end
end
