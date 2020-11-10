require './Game'
require 'pp'


messages = {correct: 'Yup, nice one', wrong: 'Whoops not right'}

players = [
  {name:'Lisa', orig_lives: 10},
  {name:'Bob', orig_lives: 5},
  {name:'Bill', orig_lives: 5}
]

gameOne = Game.new([10, 20], players, messages)

gameOne.start_game