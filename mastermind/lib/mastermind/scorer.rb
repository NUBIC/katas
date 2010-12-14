module Mastermind
  class Scorer
    
    def initialize(code)
      @code = code
    end
    
    def mark(these)
      return 'b' if @code[0] == these[0]
      return 'w' if these.include?(@code[0])
      ""
    end
    
    private
    
      def number_of_exact_matches

      end
      
      def number_of_nonexact_matches

      end
    
  end
end
