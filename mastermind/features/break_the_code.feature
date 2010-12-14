Feature: break the code

	When the code-breaker guesses correctly,
	the game is over and provides a congratulatory
	message including how many guesses it took
	to break the code.
	
	Scenario: break the code on the 1st guess
		Given the secret code is r g y b
		When I guess r g y b
		Then the game should be over
		And I should see the message "Congratulations! You broke the code in 1 guess."

	Scenario: break the code on the 2nd guess
		When the secret code is r g y b
		When I guess r g y c
		And I guess r g y b
		Then the game should be over
		And the game transcript should be 
		  """
		  Welcome to Mastermind!
		  Enter guess:
		  Score of [r g y c] is bbb
		  Enter guess:
		  Congratulations! You broke the code in 2 guesses.
		  """

	Scenario Outline: break the code on 3 or more guesses
		When I break the code on the <correct guess> guess
		Then I should see the message "<message>"
		
	Scenarios:
		| correct guess | message                           |
		|           4th | You broke the code in 4 guesses.  |
		|           7th | You broke the code in 7 guesses.  |
		|          10th | You broke the code in 10 guesses. |
		|          12th | You broke the code in 12 guesses. |