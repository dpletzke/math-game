# player
#   has score
#   has lives
#   intialize
      # original score
      # number of lives


# game
#   sets questions
#   gives prompts
#   recieves information
#   decides when game ends
    # intialize
    #   set question generator
    #   set who goes first
    #   set wrong/right messages
    #   players

class Player
  attr_accessor :score, :lives

  def initialize(score, lives)
    @score = score
    @lives = lives
  end

end

class Game  
  attr_accessor :question_range, :players, :messages
  
  def initialize(question_range, players, messages)
    @question_range = question_range
    @players = players
    @messages = messages
  end

end
