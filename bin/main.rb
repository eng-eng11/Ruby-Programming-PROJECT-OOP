require 'colorize'  # Need to run 'gem install colorize'

# self customized libary
require './lib/interface'
require './lib/board'
require './lib/player' 
require './lib/game'

include Interface

loop do
  show_text('welcome')

  player1 = Player.new(get_input('player1'), "X".red)
  player2 = Player.new(get_input('player2'), "O".green)
  board = Board.new

  game = Game.new(player1, player2, board)

  if !game.play
    show_text('finish')
    break 
  end
  
end