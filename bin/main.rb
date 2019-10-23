# require 'colorize'  # Need to run 'gem install colorize'

# self customized libary
require '../lib/interface'
require '../lib/board'
require '../lib/player'
require '../lib/game'

include Interface

loop do
  get_input('welcome')

  player1 = Player.new("player1", "X")
  player2 = Player.new("player2", "O")
  board = Board.new
  game = Game.new(player1, player2, board)

  if !game.play
    get_input('finish')
    break
  end

end
