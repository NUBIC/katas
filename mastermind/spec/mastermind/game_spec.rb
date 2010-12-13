require File.join(File.dirname(__FILE__), "/../spec_helper")

module Mastermind
  describe Game do
    
    before(:all) do
      @messenger = mock("messenger").as_null_object
      @game = Game.new(@messenger)
    end
    
    context "starting up" do
      it "should send a welcome message" do
        @messenger.should_receive(:puts).with("Welcome to Mastermind!")
      end

      it "should prompt for the first guess"
    end
    
    context "breaking the code" do

      before(:each) do
        @game.start(%w[r g y b])
      end
      
      context "on the first guess" do
        
        it "should be over"
        
        it "should return the message 'Congratulations! You broke the code in 1 guess.'"
        
      end
      
      context "on the second guess" do
                
        it "should be over"
        
        it "should return the message 'Congratulations! You broke the code in 2 guesses.'"
        
      end
      
      context "on three or more guesses" do
        
        it "should return the message 'You broke the code in 3 guesses.'"
        
        it "should return the message 'You broke the code in 4 guesses.'"
        
      end
      
    end
    
  end
end
