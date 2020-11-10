require './Game'


messages = {correct: 'Yup, nice one', wrong: 'Whoops not right'}

players = [
  {name:'Lisa', orig_lives: 6},
  {name:'Bob', orig_lives: 3},
  {name:'Bill', orig_lives: 5}
]

game = Game.new([10, 20], players, messages)

game.run_game