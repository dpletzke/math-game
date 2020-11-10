# player
#   has score
#   has lives
#   intialize
      # number of lives


class Player
  attr_accessor :name, :lives, :turn, :orig_lives

  def initialize(name, orig_lives)
    @name = name
    @lives = orig_lives
    @orig_lives = orig_lives
  end

  def lose_life
    @lives = @lives - 1
  end

end
